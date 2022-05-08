module neuron_layer1 (
	input clk,
	input rst,
	input valid,
	input bias_load,
	input signed [31:0] value,
	input signed [31:0] weight,
	output signed [31:0] relu_output
);

	reg signed [31:0] sum;
	reg signed [63:0] prod;
	reg valid2;
	
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			sum <= 32'sb0;
			prod <= 64'sb0;
			valid2 <= 1'b0;
		end
		
		else begin
			valid2 <= valid;
			
			if (bias_load) begin
				sum <= value;
			end
			
			else if (valid) begin
				prod <= value * weight;
			end
			
			if (valid2) begin
				sum <= sum + prod[47:16];
			end
		end
	end
	
	assign relu_output = (sum[31]==1'b1) ? 32'sb0 : sum; 

endmodule