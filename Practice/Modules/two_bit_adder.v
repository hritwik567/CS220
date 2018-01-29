module two_bit_adder(a,b,carry,sum);
input [1:0]a, [1:0]b;
output [1:0]sum, carry;

wire [1:0]sum, carry;
wire carry0;

fulladder(a[0],b[0],1'b0,sum[0],carry0);
fulladder(a[1],b[1],carry0,sum[1],carry);

endmodule
