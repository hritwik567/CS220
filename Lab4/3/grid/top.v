`timescale 1ns / 1ps
`include "encoder.v"
`include "main.v"
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
module top(clk,ra,rb,yi,led);
input clk,ra,rb;
input [3:0]yi;

output wire [7:0]led;
wire rot,dir;

encoder enc(clk,ra,rb,rot,dir);
main main (clk,rot,dir,yi,led);

endmodule
