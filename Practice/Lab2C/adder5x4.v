`timescale 1ns / 1ps
`include "adder4.v"
`include "adder5.v"
`include "adder6.v"
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    14:34:51 01/29/2018
// Design Name:
// Module Name:    seven_bit_adder
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
module adder5x4(y,pb1,pb2,pb3,pb4,rot,sum);
input [3:0]y;
input pb1,pb2,pb3,pb4;

output [7:0]sum;
wire [6:0]sum;

reg [3:0]a,b,c,d;
reg [5:0]x,y;
reg [6:0]z,e;

always @(posedge pb1) begin
  a<=y;
end

always @(posedge pb2) begin
  b<=y;
end

always @(posedge pb3) begin
  c<=y;
end

always @(posedge pb4) begin
  d<=y;
end

always @(posedge rot) begin
  e[6:4]<=3'b000;
  e[3:0]<=y;
end

adder4 fa41 (a,b,x);
adder4 fa42 (c,d,y);
adder5 fa5  (x,y,z);
adder6 fa6  (z,e,sum);

endmodule
