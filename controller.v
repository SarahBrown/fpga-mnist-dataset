module controller (
	input clk,
	input rst,
	output valid_pixel,
	output reg [11:0] pixel_addr,
	output reg [3:0] bias_addr,
	output reg [11:0] bias_load
);

reg [3:0] state;
reg [1:0] valid;

always @(posedge clk or posedge rst) begin
	if (rst) begin
		state <= 4'b0;
		valid <= 2'b0;
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
				
				else begin
					state <= 4'd1;
					valid <= 2'b01;
				end
			end
			
			1: begin
				if (pixel_addr < 12'd784) begin
					pixel_addr <= pixel_addr + 1'b1;
					valid[1:0] <= {valid[0],1'b1} ;
				end
				
				else begin
					state <= 4'd2;
					valid <= 2'b0;
				end
			end
			
			
		endcase
	end
end

assign valid_pixel = valid[1];

endmodule