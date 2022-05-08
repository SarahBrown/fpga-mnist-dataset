`timescale 1ns/1ps


module top_tb;

	reg clk;
	reg rst;
	wire [9:0] led;
	
	DE10_LITE_Golden_Top topTest(	.MAX10_CLK1_50(clk),
											.KEY({~rst,~rst}),
											.LEDR(led));
	
	initial
	begin
		clk = 0;
		rst = 0;
		#5 rst = 1;
		#5 rst = 0;
	end
	
	always
	begin
		clk = #5 ~clk;
	end
	
endmodule