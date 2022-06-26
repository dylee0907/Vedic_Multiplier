//`include "multiplier_16bit_2by2.v"
`include "multiplier_16bit_8by8.v"
//`include "cla_adder_8bit.v"
`include "cla_adder_16bit.v"
module multiplier_16bit_16by16(a, b, out);
   input [15:0] a, b;
   output [31:0] out;
   wire [7:0] 	 y1, y2, y3, y4, y5, y6, y7, y8, y9;
   wire 	 y10, y11, y12, y13, y14, y15, y16, y17, y18, y19;

   multiplier_16bit_8by8 i0(a[7:0], b[7:0], {y1[7:0], out[7:0]});
   multiplier_16bit_8by8 i1(a[7:0], b[15:8], {y3[7:0], y2[7:0]});
   multiplier_16bit_8by8 i2(a[15:8], b[7:0], {y5[7:0], y4[7:0]});
   multiplier_16bit_8by8 i3(a[15:8], b[15:8], {y7[7:0], y6[7:0]});

   CLA16 i4({y3[7:0], y2[7:0]}, {y5[7:0], y4[7:0]}, {y9[7:0], y8[7:0]}, 1'b0, y10);
   CLA16 i5({y9[7:0], y8[7:0]}, {y6[7:0], y1[7:0]}, out[23:8], 1'b0, y11);

   or i6(y12, y10, y11);

   HA i7(y7[0], y12, out[24], y13);
   HA i8(y7[1], y13, out[25], y14);
   HA i9(y7[2], y14, out[26], y15);
   HA i10(y7[3], y15, out[27], y16);
   HA i11(y7[4], y16, out[28], y17);
   HA i12(y7[5], y17, out[29], y18);
   HA i13(y7[6], y18, out[30], y19);
   HA i14(y7[7], y19, out[31], );
endmodule // multiplier_16bit_16by16
