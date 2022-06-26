module cla_4(S, C, A, B, C0);
	input [3:0] A, B;
	input C0;
	output [3:0] S;
	output C;
 
	wire [3:0] S, G, P;
	wire C;
	wire [3:1] c;
 	wire c1_n1, c2_n2, c2_n3, c3_n4, c3_n5, c3_n6, cout_n7, cout_n8, cout_n9;

	and and_g3(G[3], A[3], B[3]); 
	and and_g2(G[2], A[2], B[2]);
	and and_g1(G[1], A[1], B[1]);
	and and_g0(G[0], A[0], B[0]);
 
	xor xor_p3(P[3], A[3], B[3]);
	xor xor_p2(P[2], A[2], B[2]);
	xor xor_p1(P[1], A[1], B[1]);
	xor xor_p0(P[0], A[0], B[0]);
 
	and n1(c1_n1, P[0], C0); 
	or or_c1(c[1], G[0], c1_n1);
 
	and n2(c2_n2, G[0], P[1]);
	and n3(c2_n3, P[0], P[1], C0);
	or or_c2(c[2], G[1], c2_n2, c2_n3);
 
	and n4(c3_n4, G[1], P[2]);
	and n5(c3_n5, G[0], P[1], P[2]);
	and n6(c3_n6, P[0], P[1], P[2], C0);
	or or_c3(c[3], c3_n4, c3_n5, c3_n6);
 
	and n7(cout_n7, G[2], P[3]);
	and n8(cout_n8, G[1], P[2], P[3]);
	and n9(cout_n9, P[0], P[1], P[2], P[3], C0);
	or or_cout(C, G[3], cout_n7, cout_n8, cout_n9);
 
	xor xor_s0(S[0],P[0],C0); 
 	xor xor_s3(S[3],P[3],c[3]);
	xor xor_s2(S[2],P[2],c[2]);
	xor xor_s1(S[1],P[1],c[1]);

endmodule
