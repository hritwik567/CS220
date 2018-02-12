`timescale 1ns / 1ps
`include "complement_adder.v"

module adder5(cor,s,op,f);
	input [3:0]cor;
	input [1:0]s;
	input op;
	output [3:0]f;
	reg [3:0]f;
	reg last;
	wire [4:0]c;

	complement_adder uut1 (cor[0],s[0],op,op,f[0],c[0]);
	complement_adder uut2 (cor[1],s[1],c[0],op,f[1],c[1]);
	complement_adder uut3 (cor[2],0,c[1],op,f[2],c[2]);
	complement_adder uut4 (cor[3],0,c[2],op,f[3],c[3]);
	complement_adder uut5 (0,0,c[3],op,last,c[4]);




endmodule
