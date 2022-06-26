`timescale 1ns/1ns
`include "cla_adder_4bit.v"

module cla_adder_4bit_tb;
   reg clk, reset;
   reg [3:0] A, B;
   reg 	     cin;
   wire [7:0] Y;
   wire       cout;

   cla_adder_4bit i0(A, B, 1'b0, Y, cout);

   always
     #5 clk = ~clk;
   initial
     begin
	$dumpfile("cla_adder_4bit_tb.vcd");
	$dumpvars(0, cla_adder_4bit_tb);
     end
   
   initial
     begin
	clk = 0;
	reset = 1;
	A = 0;
	B = 0;
	#10 reset = 0;
	A = 2;
	B = -4;
	#10 A = 127;
	B = 130;
	#10 A = -9;
	B = 9;
	#10 $finish;
     end
endmodule // simple_mul_tb
