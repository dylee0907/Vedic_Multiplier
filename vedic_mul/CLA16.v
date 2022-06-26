`include "cla_4.v"
module CLA_16(X, Y, sum, carry_in, carry_out);
	input [15:0] X, Y;
	input carry_in;
	output [15:0] sum;
	output carry_out;
	
	wire [15:0] sum;
	wire carry_out;
	wire [2:0] carry;
	
	cla_4 CLA_1(sum[3:0], carry[0], X[3:0], Y[3:0], carry_in);
	cla_4 CLA_2(sum[7:4], carry[1], X[7:4], Y[7:4], carry[0]);
	cla_4 CLA_3(sum[11:8], carry[2], X[11:8], Y[11:8], carry[1]);
	cla_4 CLA_4(sum[15:12], carry_out, X[15:12], Y[15:12], carry[2]);
endmodule