module layer2_neuron6 (
	input clk,
	input [3:0] addr,
	output reg signed [31:0] output_value
);

reg signed [31:0] weightmem [0:9]  /* synthesis ram_init_file = "weight_layer2_neuron6.mif" */;

initial
begin
	$readmemb("weight_layer2_neuron6.txt",weightmem);
end

always @(posedge clk)
begin
	output_value <= weightmem[addr];
end

	
endmodule