`timescale 1ns / 1ps
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
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module adder5(cor,s,op,f,last);
	input [3:0]cor;
	input [1:0]s;
	input op;

	output [3:0]f;
	output last;
	wire [3:0]f;
	wire last;
	
	wire [2:0]c;

	complement_adder uut1 (cor[0],s[0],op,op,f[0],c[0]);
	complement_adder uut2 (cor[1],s[1],c[0],op,f[1],c[1]);
	complement_adder uut3 (cor[2],0,c[1],op,f[2],c[2]);
	complement_adder uut4 (cor[3],0,c[2],op,f[3],last);

endmodule
