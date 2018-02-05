`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:07:17 01/29/2018 
// Design Name: 
// Module Name:    comp 
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
module comp(a,b,p1,p2,p3,l1,l2,l3);
input a, b;

input p1, p2, p3;

output l1, l2, l3;

wire l1, l2, l3;

assign l1 = (~p2)&(p1|((~a)&b));  //true if a<b or previous is true
assign l2 = (~p1)&(p2|(a&(~b)));  //true if a>b or previous is true 
assign l3 = (~p1)&(~p2)&((a&b)|((~a)&(~b)));   //true if a=b

endmodule
