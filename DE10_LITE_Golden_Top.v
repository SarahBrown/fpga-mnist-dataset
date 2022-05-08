module DE10_LITE_Golden_Top(
	input 		          		MAX10_CLK1_50,
	// output		     [7:0]		HEX0,
	// output		     [7:0]		HEX1,
	// output		     [7:0]		HEX2,
	// output		     [7:0]		HEX3,
	// output		     [7:0]		HEX4,
	// output		     [7:0]		HEX5,
	input 		     [1:0]		KEY,
	output		     [9:0]		LEDR
	// input 		     [9:0]		SW
);

// REG/Wires

wire rst;
wire valid;
wire [11:0] pixel_addr;
wire [11:0] bias_load;
wire [3:0] bias_addr;
wire [3:0] neuron1_addr;

wire signed [31:0] pixel_value;
wire signed [31:0] bias1_value;
wire signed [31:0] bias2_value;

wire signed [31:0] w1n0_value;
wire signed [31:0] w1n1_value;
wire signed [31:0] w1n2_value;
wire signed [31:0] w1n3_value;
wire signed [31:0] w1n4_value;
wire signed [31:0] w1n5_value;
wire signed [31:0] w1n6_value;
wire signed [31:0] w1n7_value;
wire signed [31:0] w1n8_value;
wire signed [31:0] w1n9_value;

wire signed [31:0] w2n0_value;
wire signed [31:0] w2n1_value;
wire signed [31:0] w2n2_value;
wire signed [31:0] w2n3_value;
wire signed [31:0] w2n4_value;
wire signed [31:0] w2n5_value;
wire signed [31:0] w2n6_value;
wire signed [31:0] w2n7_value;
wire signed [31:0] w2n8_value;
wire signed [31:0] w2n9_value;

wire signed [31:0] relu_value [0:9];
wire signed [31:0] layer1_databus;

assign rst = ~KEY[0] | ~KEY[1];
assign layer1_databus = (|bias_load) ? bias1_value : 32'sb0;

controller 		ctrl(	.clk(MAX10_CLK1_50),
							.rst(rst),
							.pixel_addr(pixel_addr),
							.bias_addr(bias_addr),
							.bias_load(bias_load)
							);

test_mem			t0(.clk(MAX10_CLK1_50),
						.addr(pixel_addr),
						.output_value(pixel_value));
						
bias_mem1		b1(.clk(MAX10_CLK1_50),
						.addr(bias_addr),
						.output_value(bias1_value));
						
bias_mem2		b2(.clk(MAX10_CLK1_50),
						.addr(bias_addr),
						.output_value(bias2_value));
						
layer1_neuron0 w1n0(	.clk(MAX10_CLK1_50),
							.addr(pixel_addr),
							.output_value(w1n0_value));

layer1_neuron1 w1n1(	.clk(MAX10_CLK1_50),
							.addr(pixel_addr),
							.output_value(w1n1_value));
						
layer1_neuron2 w1n2(	.clk(MAX10_CLK1_50),
							.addr(pixel_addr),
							.output_value(w1n2_value));
												
layer1_neuron3 w1n3(	.clk(MAX10_CLK1_50),
							.addr(pixel_addr),
							.output_value(w1n3_value));
						
layer1_neuron4 w1n4(	.clk(MAX10_CLK1_50),
							.addr(pixel_addr),
							.output_value(w1n4_value));
												
layer1_neuron5 w1n5(	.clk(MAX10_CLK1_50),
							.addr(pixel_addr),
							.output_value(w1n5_value));						
						
layer1_neuron6 w1n6(	.clk(MAX10_CLK1_50),
							.addr(pixel_addr),
							.output_value(w1n6_value));						
						
layer1_neuron7 w1n7(	.clk(MAX10_CLK1_50),
							.addr(pixel_addr),
							.output_value(w1n7_value));					
						
layer1_neuron8 w1n8(	.clk(MAX10_CLK1_50),
							.addr(pixel_addr),
							.output_value(w1n8_value));					
											
layer1_neuron9 w1n9(	.clk(MAX10_CLK1_50),
							.addr(pixel_addr),
							.output_value(w1n9_value));					
																						
layer2_neuron0 w2n0(	.clk(MAX10_CLK1_50),
							.addr(neuron1_addr),
							.output_value(w2n0_value));

layer2_neuron1 w2n1(	.clk(MAX10_CLK1_50),
							.addr(neuron1_addr),
							.output_value(w2n1_value));
						
layer2_neuron2 w2n2(	.clk(MAX10_CLK1_50),
							.addr(neuron1_addr),
							.output_value(w2n2_value));
												
layer2_neuron3 w2n3(	.clk(MAX10_CLK1_50),
							.addr(neuron1_addr),
							.output_value(w2n3_value));
						
layer2_neuron4 w2n4(	.clk(MAX10_CLK1_50),
							.addr(neuron1_addr),
							.output_value(w2n4_value));
												
layer2_neuron5 w2n5(	.clk(MAX10_CLK1_50),
							.addr(neuron1_addr),
							.output_value(w2n5_value));						
						
layer2_neuron6 w2n6(	.clk(MAX10_CLK1_50),
							.addr(neuron1_addr),
							.output_value(w2n6_value));						
						
layer2_neuron7 w2n7(	.clk(MAX10_CLK1_50),
							.addr(neuron1_addr),
							.output_value(w2n7_value));					
						
layer2_neuron8 w2n8(	.clk(MAX10_CLK1_50),
							.addr(neuron1_addr),
							.output_value(w2n8_value));					
											
layer2_neuron9 w2n9(	.clk(MAX10_CLK1_50),
							.addr(neuron1_addr),
							.output_value(w2n9_value));
							
							
neuron_layer1 	n0(	.clk(MAX10_CLK1_50),
							.rst(rst),
							.valid(valid),
							.bias_load(bias_load),
							.value(layer1_databus),
							.weight(w1n0_value),
							.relu_output(relu_value[0]));
								
							
endmodule