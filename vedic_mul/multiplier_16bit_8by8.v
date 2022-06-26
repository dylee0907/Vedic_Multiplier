//`include "multiplier_16bit_2by2.v"
`include "multiplier_16bit_4by4.v"
//`include "cla_adder_4bit.v"
`include "cla_adder_8bit.v"
module multiplier_16bit_8by8(a, b, out);
   input [7:0] a, b;
   output [15:0] out;
   wire [3:0] 	 y1, y2, y3, y4, y5, y6, y7, y8, y9;
   wire 	 y10, y11;

   multiplier_16bit_4by4 i0(a[3:0], b[3:0], {y1[3:0], out[3:0]});
   multiplier_16bit_4by4 i1(a[3:0], b[7:4], {y3[3:0], y2[3:0]});
   multiplier_16bit_4by4 i2(a[7:4], b[3:0], {y5[3:0], y4[3:0]});
   multiplier_16bit_4by4 i3(a[7:4], b[7:4], {y7[3:0], y6[3:0]});

   cla_adder_8bit i4({y3[3:0], y2[3:0]}, {y5[3:0], y4[3:0]}, 1'b0,  {y9[3:0], y8[3:0]}, y10);
   cla_adder_8bit i5({y9[3:0], y8[3:0]}, {y6[3:0], y1[3:0]}, 1'b0, out[11:4], y11);

   or i6(y12, y10, y11);

   HA i7(y7[0], y12, out[12], y13);
   HA i8(y7[1], y13, out[13], y14);
   HA i9(y7[2], y14, out[14], y15);
   HA i10(y7[3], y15, out[15], );
endmodule // multiplier_16bit_4by4
