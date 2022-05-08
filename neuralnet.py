import sys
import numpy as np

from keras.datasets import mnist
from keras.models import Sequential, load_model
from keras.layers import Dense, Activation
from keras.utils import np_utils

# function to create digit recognition model with keras
def train_model(batch_size, epochs):
    (x_train, y_train), (x_test, y_test) = mnist.load_data()

    num_of_trainImgs = x_train.shape[0]
    num_of_testImgs = x_test.shape[0] 
    img_width = x_train.shape[1]
    img_height = x_train.shape[2]
    
    x_train = x_train.reshape(num_of_trainImgs, img_height*img_width)/32
    x_test = x_test.reshape(num_of_testImgs, img_height*img_width)/32

    y_train = np_utils.to_categorical(y_train, 10)     
    y_test = np_utils.to_categorical(y_test, 10)

    model = Sequential()
    model.add(Dense(10,input_dim=784))
    model.add(Activation('relu'))
    model.add(Dense(10))
    model.add(Activation('softmax'))

    model.compile(loss='categorical_crossentropy', metrics=['accuracy'], optimizer='sgd')

    model.fit(x_train, y_train, batch_size=batch_size, epochs=epochs, verbose=1)
    model.save('trained_model.h5')

    score = model.evaluate(x_test, y_test, verbose=1)
    print('Test accuracy:', score[1])

    return model

# convert float number to fixed point
def float_to_fixed(n):
    a = n * 0x10000
    b = int(round(a))
    # if n is negative, perform 2's complement
    if (n < 0):
        b = abs(b)
        b = (~b) & 0xffffffff
        b = b+1

    return b

# convert fixed point to float number
def fixed_to_float(n):
    sign = 1
    # if leading bit is 1, number is negative. perform 2's complement
    if (n & 0x80000000):
        sign = -1
        n = n-1
        n = (~n) & 0xffffffff
    
    n = sign * n / 0x10000
    return n

# converts floating point number to fixed point and back to add error to test
# this checks that fixed point is accurate enough for fpga implementation
def ff(n):
    return(fixed_to_float(float_to_fixed(n)))

def test_build_model(first_layer_biases, first_layer_weights, second_layer_biases, second_layer_weights):
    (x_train, y_train),(x_test, y_test) = mnist.load_data() # loads mnist data

    num_of_testImgs = x_test.shape[0] 
    img_width = x_train.shape[1]
    img_height = x_train.shape[2]

    x_test = x_test.reshape(num_of_testImgs, img_height*img_width)/32

    correct = 0
    incorrect = 0

    # iterates over each image
    for testimg in range(1): #len(x_test)):
        layer1 = [0.0] * 10 # creates a list with 10 entries initialized to 0.0
        # loops over each neuron in first layer to add bias value
        for neuron in range(10): 
            layer1[neuron] = ff(first_layer_biases[neuron])

        # loops over each pixel
        for pixel in range(img_width*img_height):
            for neuron in range(10): 
                layer1[neuron] = ff(layer1[neuron] + ff(ff(x_test[testimg][pixel]) * ff(first_layer_weights[pixel][neuron])))

        # applies ReLU
        for neuron in range(10):
            layer1[neuron] = max(0, layer1[neuron])
        
        layer2 = [0.0] * 10 # creates a list with 10 entries initialized to 0.0
        # loops over each neuron in second layer to add bias value
        for neuron in range(10): 
            layer2[neuron] = ff(second_layer_biases[neuron])

        # loops over each pixel
        for neuron_layer1 in range(10):
            for neuron_layer2 in range(10): 
                layer2[neuron_layer2] = ff(layer2[neuron_layer2] + ff(ff(layer1[neuron_layer1]) * ff(second_layer_weights[neuron_layer1][neuron_layer2])))

        m = max(layer2) # applies soft max
        print(m, layer2.index(m), y_test[testimg])
        if (layer2.index(m) == y_test[testimg]):
            correct += 1
        else:
            incorrect += 1

        print(f'Correct: {correct}. Incorrect: {incorrect}')

def mem_template(filename_mif, filename_txt, data, depth):
    org_stdout = sys.stdout
    sys.stdout = open(filename_mif,'w')

    print(f'DEPTH = {depth};')
    print('WIDTH = 32;')
    print('ADDRESS_RADIX = HEX;')
    print('DATA_RADIX = BIN;')
    print('CONTENT')
    print('BEGIN')

    for n in range(depth):
        print(hex(n)[2:].zfill(4)+' : '+bin(float_to_fixed(data[n]))[2:].zfill(32)+';  % 0x'+hex(float_to_fixed(data[n]))[2:].zfill(8) +'  '+ str(data[n])+' %')

    print('END;')
    sys.stdout.close()
    sys.stdout = open(filename_txt,'w')

    for n in range(depth):
        print(bin(float_to_fixed(data[n]))[2:].zfill(32))

    sys.stdout.close()
    sys.stdout = org_stdout

def build_FPGA_memfiles(first_layer_biases, first_layer_weights, second_layer_biases, second_layer_weights):
    (x_train, y_train),(x_test, y_test) = mnist.load_data() # loads mnist data

    num_of_testImgs = x_test.shape[0] 
    img_width = x_train.shape[1]
    img_height = x_train.shape[2]

    x_test = x_test.reshape(num_of_testImgs, img_height*img_width)/32

    first_layer_weights = np.asarray(first_layer_weights).transpose().tolist()
    second_layer_weights = np.asarray(second_layer_weights).transpose().tolist()

    mem_template('test0.mif', 'test0.txt', x_test[0], img_height*img_width) 
    for neuron in range(10):
        mem_template(f'weight_layer1_neuron{neuron}.mif', f'weight_layer1_neuron{neuron}.txt',  first_layer_weights[neuron], 784) # first layer weights
        mem_template(f'weight_layer2_neuron{neuron}.mif', f'weight_layer2_neuron{neuron}.txt', second_layer_weights[neuron], 10) # second layer weights
    
    mem_template('bias_layer1.mif', 'bias_layer1.txt', first_layer_biases, 10) # first bias values
    mem_template('bias_layer2.mif', 'bias_layer2.txt', second_layer_biases, 10) # second bias values

def main():
    # model = train_model(100, 20)
    model = load_model('trained_model.h5')

    model.summary()

    first_dense = model.layers[0]
    second_dense = model.layers[2]

    first_layer_weights = (first_dense.get_weights()[0])
    first_layer_biases = (first_dense.get_weights()[1])
    second_layer_weights = (second_dense.get_weights()[0])
    second_layer_biases = (second_dense.get_weights()[1])

    test_build_model(first_layer_biases, first_layer_weights, second_layer_biases, second_layer_weights)
    build_FPGA_memfiles(first_layer_biases, first_layer_weights, second_layer_biases, second_layer_weights)

if __name__ == "__main__":
    main()