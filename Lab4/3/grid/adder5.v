`timescale 1ns / 1ps
`include "complement_adder.v"
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    16:02:18 02/12/2018
// Design Name:
// Module Name:    adder5
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - tmpile Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module adder5(pos,step,op,tmp,last);
	input [3:0] pos;
	input [1:0] step;
	input op;

	output wire [3:0]tmp;
	output wire last;

	wire [2:0]c;

	complement_adder ca1 (pos[0],step[0],op,op,tmp[0],c[0]);
	complement_adder ca2 (pos[1],step[1],c[0],op,tmp[1],c[1]);
	complement_adder ca3 (pos[2],1'b0,c[1],op,tmp[2],c[2]);
	complement_adder ca4 (pos[3],1'b0,c[2],op,tmp[3],last);

endmodule
