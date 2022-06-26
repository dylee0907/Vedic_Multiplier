`include "CLA_16.v"
module CLA_32(X,Y,sum,carry_in,carry_out);
	input [31:0]X;
	input [31:0]Y;
	input carry_in;
	output [31:0] sum;
	output carry_out;
	
	wire [31:0] sum;
	wire carry_out;
	wire carry;
	
	CLA_16 x1(X[15:0], Y[15:0], sum[15:0], carry_in, carry);
	CLA_16 x2(X[31:16], Y[31:16], sum[31:16], carry, carry_out);
endmodule
