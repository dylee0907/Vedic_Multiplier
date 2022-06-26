`include "multiplier_16bit_2by2.v"
`include "cla_adder_4bit.v"
module multiplier_16bit_4by4(a, b, out);
   input [3:0] a, b;
   output [7:0] out;
   wire y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14, y15, y16, y17, y18, y19, y20, y21, y22	;

   multiplier_16bit_2by2 i0(a[1:0], b[1:0], {y2, y1,out[1:0]});
   multiplier_16bit_2by2 i1(a[3:2], b[1:0], {y6, y5, y4, y3});
   multiplier_16bit_2by2 i2(a[1:0], b[3:2], {y10, y9, y8, y7});
   multiplier_16bit_2by2 i3(a[3:2], b[3:2], {y14, y13, y12, y11});

   cla_adder_4bit i4({y10, y9, y8, y7}, {y6, y5, y4, y3}, 1'b0,  {y18, y17, y16, y15}, y19);
   cla_adder_4bit i5({y12, y11, y2, y1}, {y18, y17, y16, y15}, 1'b0, out[5:2], y20);

   or i6(y21, y19, y20);

   HA i7(y13, y21, out[6], y22);
   HA i8(y14, y22, out[7], );
endmodule // multiplier_16bit_4by4
