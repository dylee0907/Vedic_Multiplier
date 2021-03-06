`include "multiplier_16bit_16by16.v"
`include "CLA_32.v"
module vedic_32x32(a,b,c);
	input [31:0]a;
	input [31:0]b;
	output [63:0]c;

	wire [31:0]q0;	
	wire [31:0]q1;	
	wire [31:0]q2;
	wire [31:0]q3;	
	wire [63:0]c;
	wire [31:0]temp1;
	wire [31:0]temp2;
	wire [31:0]q4;
	wire [31:0]q5;
	wire [31:0]q6;
	wire q7,x1,x2,x3;
// using 4 16x16 multipliers
	multiplier_16bit_16by16 z1(a[15:0],b[15:0],q0[31:0]);
	multiplier_16bit_16by16 z2(a[31:16],b[15:0],q1[31:0]);
	multiplier_16bit_16by16 z3(a[15:0],b[31:16],q2[31:0]);
	multiplier_16bit_16by16 z4(a[31:16],b[31:16],q3[31:0]);

// stage 1 adders 
	CLA_32 z5(q1[31:0],q2[31:0],q4,1'b0,x1);
	assign temp1 ={16'b0,q0[31:16]};
	CLA_32 z6(q4[31:0],temp1,q5,1'b0,x2);
	or z7(q7,x1,x2);
	assign temp2 ={15'b0,q7,q5[31:16]};
	CLA_32 z8(q3[31:0],temp2,q6,1'b0,x3);
	

// fnal output assignment 
	assign c[15:0]=q0[15:0];
	assign c[31:16]=q5[15:0];
	assign c[63:32]=q6[31:0];

endmodule