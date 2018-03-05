`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:03:10 02/12/2018 
// Design Name: 
// Module Name:    move 
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
module move(cor,step,op,out);

input [3:0]cor;
input [1:0]step; 
input op;

output [3:0]out;
wire [3:0]out;

wire [3:0]oa;
wire last;

adder5 uut (cor,step,op,oa,last);

assign out[0] = (oa[0]&(~last))|((~op)&last); 
assign out[1] = (oa[1]&(~last))|((~op)&last); 
assign out[2] = (oa[2]&(~last))|((~op)&last); 
assign out[3] = (oa[3]&(~last))|((~op)&last);

endmodule