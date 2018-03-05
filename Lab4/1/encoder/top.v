`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:29:50 02/12/2018 
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
`timescale 1ns / 1ps
module top(clock,rota,rotb,led);

input clock,rota,rotb;

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
ripple uut2 (
	.clk(clock),
	.rot(rot),
	.dir(dir),
	.led(led)
);


endmodule
