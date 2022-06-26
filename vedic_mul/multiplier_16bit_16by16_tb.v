`timescale 1ns/1ns
`include "multiplier_16bit_16by16.v"

module multiplier_16bit_16by16_tb;
   reg clk, reset;
   reg [15:0] A, B;
   wire [31:0] Y;

   multiplier_16bit_16by16 i0 (A, B, Y);

   always
     #5 clk = ~clk;
   initial
     begin
	$dumpfile("multiplier_16bit_16by16_tb.vcd");
	$dumpvars(0, multiplier_16bit_16by16_tb);
     end
   
   initial
     begin
	clk = 0;
	reset = 1;
	A = 0;
	B = 0;
	#10 reset = 0;
	A = 2323;
	B = 7;
	#10 A = 25;
	B = 13434;
	#10 A = -9;
	B = 9;
	#10 $finish;
     end
endmodule // simple_mul_tb
