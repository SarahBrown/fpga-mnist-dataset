module bias_mem2 (
	input clk,
	input [3:0] addr,
	output reg signed [31:0] output_value
);

reg signed [31:0] biasmem [0:9]  /* synthesis ram_init_file = "bias_layer2.mif" */;

initial
begin
	$readmemb("bias_layer2.txt",biasmem);
end

always @(posedge clk)
begin
	output_value <= biasmem[addr];
end

	
endmodule