module test_mem (
	input clk,
	input [11:0] addr,
	output reg signed [31:0] output_value
);

reg signed [31:0] pixmem [0:783]  /* synthesis ram_init_file = "test0.mif" */;

initial
begin
	$readmemb("test0.txt",pixmem);
end

always @(posedge clk)
begin
	output_value <= pixmem[addr];
end

	
endmodule