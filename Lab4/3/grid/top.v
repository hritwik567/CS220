`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:13:03 02/12/2018 
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
module top(clock,rota,rotb,y,led);

input clock,rota,rotb;
input [3:0]y;

output [7:0]led;
wire rot,dir;
wire [7:0]led;

encoder uut1 (
	.clk(clock),
	.rota(rota),
	.rotb(rotb),
	.rot(rot),
	.dir(dir)
);

main uut2 (
	.yi(y),
	.clk(clock),
	.rot(rot),
	.aa(dir),
	.led(led)
);

endmodule
