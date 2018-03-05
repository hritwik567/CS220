`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:12:41 02/12/2018 
// Design Name: 
// Module Name:    top 
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
module top(clock,rota,rotb,y,sum);

input clock,rota,rotb;
input [3:0]y;

output [7:0]sum;
wire rot,dir;
wire [7:0]sum;

encoder uut1 (
	.clk(clock),
	.rota(rota),
	.rotb(rotb),
	.rot(rot),
	.dir(dir)
);
adder7 uut2 (
	.y(y),
	.clk(clock),
	.rot(rot),
	.dir(dir),
	.sum(sum)
);


endmodule
