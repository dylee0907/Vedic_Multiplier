module mux2_1(
	input [14:0] a, b,
	input sel,
	output [14:0] q
	);

	assign q = sel ? b : a;
	
endmodule