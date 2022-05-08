module controller (
	input clk,
	input rst,
	output reg [11:0] pixel_addr,
	output reg [3:0] bias_addr,
	output reg [11:0] bias_load
);

reg [3:0] state;

always @(posedge clk or posedge rst) begin
	if (rst) begin
		state <= 4'b0;
		pixel_addr <= 12'b0;
		bias_addr <= 4'b0;
		bias_load <= 12'b1;
	end
	
	else begin
		case (state)
			0: begin
				if (bias_addr < 4'd10) begin
					bias_addr <= bias_addr + 1'b1;
					bias_load[11:0] <= {bias_load[10:0],1'b0};
				end
				
				else 
					state <= 4'd1;
			end
		endcase
	end
end

endmodule