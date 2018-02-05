`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    14:09:02 01/29/2018
// Design Name:
// Module Name:    full_adder
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module full_adder(a,b,c,sum,carry);
	input a, b, c;
	output sum, carry;

	wire sum, carry;

	assign sum = a^b^c;
	assign carry = ((a&b)|(b&c)|(c&a));

endmodule
