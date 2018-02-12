`timescale 1ns / 1ps
module complement_adder(a,b,c,op,sum,carry);
input a,b,c,op;
output sum, carry;

wire sum, carry;

assign sum = a^b^c^op;
assign carry = ((a&(b^op))|((b^op)&c)|(c&a));

endmodule
