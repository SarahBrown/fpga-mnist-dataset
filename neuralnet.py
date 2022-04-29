from keras.datasets import mnist
from keras.models import Sequential, load_model
from keras.layers import Dense, Activation
from keras.utils import np_utils

def train_model(batch_size, epochs):
    (x_train, y_train), (x_test, y_test) = mnist.load_data()

    num_of_trainImgs = x_train.shape[0]
    num_of_testImgs = x_test.shape[0] 
    img_width = x_train.shape[1]
    img_height = x_train.shape[2]
    
    x_train = x_train.reshape(num_of_trainImgs, img_height*img_width)/255
    x_test = x_test.reshape(num_of_testImgs, img_height*img_width)/255

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

def main():
    # model = train_model(100, 15)
    model = load_model('trained_model.h5')

    model.summary()

    first_dense = model.layers[0]
    second_dense = model.layers[2]

    first_layer_weights = (first_dense.get_weights()[0])
    first_layer_biases = (first_dense.get_weights()[1])
    second_layer_weights = (second_dense.get_weights()[0])
    second_layer_biases = (second_dense.get_weights()[1])

if __name__ == "__main__":
    main()