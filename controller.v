module controller (
	input clk,
	input rst,
	output valid_pixel,
	output valid_digit,
	output reg check_max,
	output reg [11:0] pixel_addr,
	output reg [3:0] bias_addr,
	output reg [11:0] bias_load,
	output reg [3:0] layer1_addr,
	output reg [3:0] layer1_addr_delay

);

reg [3:0] state;
reg [1:0] valid;
reg valid_layer2;
reg [2:0] delay;

always @(posedge clk or posedge rst) begin
	layer1_addr_delay <= layer1_addr;

	if (rst) begin
		check_max <= 1'b0;
		state <= 4'b0;
		valid <= 2'b0;
		valid_layer2 <= 2'b0;
		delay <= 3'b0;
		pixel_addr <= 12'b0;
		bias_addr <= 4'b0;
		layer1_addr <= 4'b0;
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
					bias_load <= 12'b0;
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
					delay <= 3'b0;
				end
			end
			
			2: begin
				if (delay < 3'd6) begin
					delay <= delay + 1'b1;
				end
				
				else if (delay == 3'd6) begin
					delay <= delay + 1'b1;
				end
				
				else begin
					layer1_addr <= layer1_addr + 1'b1;
					valid_layer2 <= 1'b1;
					state <= 4'd3;
				end
			end
			
			3: begin
					if (layer1_addr < 4'd10) begin
						layer1_addr <= layer1_addr + 1'b1;
					end
					
					else begin
						state <= 4'd4;
						valid_layer2 <= 1'b0;
					end
			end
			
			4: begin
					check_max <= 1'b1;		
			end
			
			
		endcase
	end
end

assign valid_pixel = valid[1];
assign valid_digit = valid_layer2;

endmodule