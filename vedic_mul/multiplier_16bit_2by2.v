`include "HA.v"
module multiplier_16bit_2by2(a, b, out);
   input [1:0] a, b;
   output [3:0] out;
   wire 	y1, y2, y3, y4;
   
   and i0(out[0], a[0], b[0]);
   and i1(y1, a[0], b[1]);
   and i2(y2, a[1], b[0]);
   and i3(y4, a[1], b[1]);

   HA i4(y1, y2, out[1], y3);
   HA i5(y3, y4, out[2], out[3]);

endmodule // multiplier_16bit_2by2
