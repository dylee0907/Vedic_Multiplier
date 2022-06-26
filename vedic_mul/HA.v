module HA(x, y, sum, carry);
   input x, y;
   output sum, carry;

//   assign sum = x ^ y;
//   assign carry = x & y;
   xor i0(sum, x, y);
   and i1(carry, x, y);
endmodule // halfadder
