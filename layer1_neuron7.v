module layer1_neuron7 (
	input clk,
	input [11:0] addr,
	output reg signed [31:0] output_value
);

reg signed [31:0] weightmem [0:783]  /* synthesis ram_init_file = "weight_layer1_neuron7.mif" */;

initial
begin
	$readmemb("weight_layer1_neuron7.txt",weightmem);
end

always @(posedge clk)
begin
	output_value <= weightmem[addr];
end

	
endmodule