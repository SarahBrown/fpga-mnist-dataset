module DE10_LITE_Golden_Top(
	input 		          		MAX10_CLK1_50,
	output		     [7:0]		HEX0,
	//output		     [7:0]		HEX1,
	//output		     [7:0]		HEX2,
	//output		     [7:0]		HEX3,
	//output		     [7:0]		HEX4,
	//output		     [7:0]		HEX5,
	input 		     [1:0]		KEY
	//output		     [9:0]		LEDR
	//input 		     [9:0]		SW
);

// REG/Wires

reg [3:0] max_index;
reg signed [31:0] max_value;

reg [3:0] next_index;
reg signed [31:0] next_max;
integer i;

wire rst;
wire valid;
wire valid_layer2;
wire check_max;
wire [11:0] pixel_addr;
wire [11:0] bias_load;
wire [3:0] bias_addr;
wire [3:0] neuron1_addr;
wire [3:0] neuron1_addr_delay;

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
wire signed [31:0] digit_output [0:9];
wire signed [31:0] layer1_databus;
wire signed [31:0] layer2_databus;

assign rst = ~KEY[0] | ~KEY[1];
assign layer1_databus = (|bias_load) ? bias1_value : pixel_value;
assign layer2_databus = (|bias_load) ? bias2_value : relu_value[neuron1_addr_delay];


// for loop https://stackoverflow.com/questions/70092678/find-maximum-number-present-in-verilog-array
always@(posedge MAX10_CLK1_50) begin
	if (rst) begin
		max_value <= 31'b0;
		max_index <= 4'b0;
	end
  
	else begin
		max_value <= next_max;
		max_index <= next_index;
	end	
end

always @(*) begin
	next_max = digit_output[0];
	next_index = 4'b0;
	
	for (i = 1; i <= 9; i=i+1) begin // <-- start at 1, not 0 (0 is same a default)
		if (digit_output[i] > next_max) begin
			next_max  = digit_output[i];
			next_index = i;
		end
	end 
end   


sevenSeg 		hex0(	.sel(max_index), 
							.segs(HEX0));

controller 		ctrl(	.clk(MAX10_CLK1_50),
							.rst(rst),
							.valid_pixel(valid),
							.valid_digit(valid_layer2),
							.check_max(check_max),
							.pixel_addr(pixel_addr),
							.bias_addr(bias_addr),
							.bias_load(bias_load),
							.layer1_addr(neuron1_addr),
							.layer1_addr_delay(neuron1_addr_delay));

test_mem			t0(.clk(MAX10_CLK1_50),
						.addr(pixel_addr),
						.output_value(pixel_value));
						
bias_mem1		b1(.clk(MAX10_CLK1_50),
						.addr(bias_addr),
						.output_value(bias1_value));
						
bias_mem2		b2(.clk(MAX10_CLK1_50),
						.addr(bias_addr),
						.output_value(bias2_value));
						
neuron_layer1 	n0(	.clk(MAX10_CLK1_50),
							.rst(rst),
							.valid(valid),
							.bias_load(bias_load[1]),
							.value(layer1_databus),
							.weight(w1n0_value),
							.relu_output(relu_value[0]));	
							
neuron_layer1 	n1(	.clk(MAX10_CLK1_50),
							.rst(rst),
							.valid(valid),
							.bias_load(bias_load[2]),
							.value(layer1_databus),
							.weight(w1n1_value),
							.relu_output(relu_value[1]));	
							
neuron_layer1 	n2(	.clk(MAX10_CLK1_50),
							.rst(rst),
							.valid(valid),
							.bias_load(bias_load[3]),
							.value(layer1_databus),
							.weight(w1n2_value),
							.relu_output(relu_value[2]));	
							
neuron_layer1 	n3(	.clk(MAX10_CLK1_50),
							.rst(rst),
							.valid(valid),
							.bias_load(bias_load[4]),
							.value(layer1_databus),
							.weight(w1n3_value),
							.relu_output(relu_value[3]));
							
neuron_layer1 	n4(	.clk(MAX10_CLK1_50),
							.rst(rst),
							.valid(valid),
							.bias_load(bias_load[5]),
							.value(layer1_databus),
							.weight(w1n4_value),
							.relu_output(relu_value[4]));			

neuron_layer1 	n5(	.clk(MAX10_CLK1_50),
							.rst(rst),
							.valid(valid),
							.bias_load(bias_load[6]),
							.value(layer1_databus),
							.weight(w1n5_value),
							.relu_output(relu_value[5]));			

neuron_layer1 	n6(	.clk(MAX10_CLK1_50),
							.rst(rst),
							.valid(valid),
							.bias_load(bias_load[7]),
							.value(layer1_databus),
							.weight(w1n6_value),
							.relu_output(relu_value[6]));	

neuron_layer1 	n7(	.clk(MAX10_CLK1_50),
							.rst(rst),
							.valid(valid),
							.bias_load(bias_load[8]),
							.value(layer1_databus),
							.weight(w1n7_value),
							.relu_output(relu_value[7]));	

neuron_layer1 	n8(	.clk(MAX10_CLK1_50),
							.rst(rst),
							.valid(valid),
							.bias_load(bias_load[9]),
							.value(layer1_databus),
							.weight(w1n8_value),
							.relu_output(relu_value[8]));	

neuron_layer1 	n9(	.clk(MAX10_CLK1_50),
							.rst(rst),
							.valid(valid),
							.bias_load(bias_load[10]),
							.value(layer1_databus),
							.weight(w1n9_value),
							.relu_output(relu_value[9]));	

neuron_layer2 	n10(	.clk(MAX10_CLK1_50),
							.rst(rst),
							.valid(valid_layer2),
							.bias_load(bias_load[1]),
							.value(layer2_databus),
							.weight(w2n0_value),
							.digit_output(digit_output[0]));

neuron_layer2 	n11(	.clk(MAX10_CLK1_50),
							.rst(rst),
							.valid(valid_layer2),
							.bias_load(bias_load[2]),
							.value(layer2_databus),
							.weight(w2n1_value),
							.digit_output(digit_output[1]));	

neuron_layer2 	n12(	.clk(MAX10_CLK1_50),
							.rst(rst),
							.valid(valid_layer2),
							.bias_load(bias_load[3]),
							.value(layer2_databus),
							.weight(w2n2_value),
							.digit_output(digit_output[2]));	

neuron_layer2 	n13(	.clk(MAX10_CLK1_50),
							.rst(rst),
							.valid(valid_layer2),
							.bias_load(bias_load[4]),
							.value(layer2_databus),
							.weight(w2n3_value),
							.digit_output(digit_output[3]));	
							
neuron_layer2 	n14(	.clk(MAX10_CLK1_50),
							.rst(rst),
							.valid(valid_layer2),
							.bias_load(bias_load[5]),
							.value(layer2_databus),
							.weight(w2n4_value),
							.digit_output(digit_output[4]));	
							
neuron_layer2 	n15(	.clk(MAX10_CLK1_50),
							.rst(rst),
							.valid(valid_layer2),
							.bias_load(bias_load[6]),
							.value(layer2_databus),
							.weight(w2n5_value),
							.digit_output(digit_output[5]));	
							
neuron_layer2 	n16(	.clk(MAX10_CLK1_50),
							.rst(rst),
							.valid(valid_layer2),
							.bias_load(bias_load[7]),
							.value(layer2_databus),
							.weight(w2n6_value),
							.digit_output(digit_output[6]));	
							
neuron_layer2 	n17(	.clk(MAX10_CLK1_50),
							.rst(rst),
							.valid(valid_layer2),
							.bias_load(bias_load[8]),
							.value(layer2_databus),
							.weight(w2n7_value),
							.digit_output(digit_output[7]));	
							
neuron_layer2 	n18(	.clk(MAX10_CLK1_50),
							.rst(rst),
							.valid(valid_layer2),
							.bias_load(bias_load[9]),
							.value(layer2_databus),
							.weight(w2n8_value),
							.digit_output(digit_output[8]));	
							
neuron_layer2 	n19(	.clk(MAX10_CLK1_50),
							.rst(rst),
							.valid(valid_layer2),
							.bias_load(bias_load[10]),
							.value(layer2_databus),
							.weight(w2n9_value),
							.digit_output(digit_output[9]));								
						
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
							
							

							
endmodule
