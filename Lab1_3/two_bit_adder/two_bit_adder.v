`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:44:29 01/15/2018 
// Design Name: 
// Module Name:    two_bit_adder 
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
module two_bit_adder(a,b,cout,sum);
input [1:0]a,[1:0]b;
output [1:0]sum, cout;

wire [1:0]sum, cout;
wire carry0;

full_adder uut1 (a[0],b[0],1'b0,sum[0],carry0);
full_adder uut2 (a[1],b[1],carry0,sum[1],cout);

endmodule

