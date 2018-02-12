`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:46:52 02/05/2018 
// Design Name: 
// Module Name:    adder5x4 
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
module adder5x4(yi,pb1,pb2,pb3,pb4,rot,sum);
	input [3:0]yi;
	input pb1,pb2,pb3,pb4,rot;

	output [6:0]sum;
	wire [6:0]sum;

	reg [3:0] a,b,c,d;
	wire [4:0]x,y;
	wire [5:0]z;
	reg [5:0]e;

	always @(posedge pb1) begin
	  a<=yi;
	end

	always @(posedge pb2) begin
	  b<=yi;
	end

	always @(posedge pb3) begin
	  c<=yi;
	end

	always @(posedge pb4) begin
	  d<=yi;
	end

	always @(posedge rot) begin
	  e[5:4]<=2'b0;
	  e[3:0]<=yi;
	end

	adder4 fa41 (a,b,x);
	adder4 fa42 (c,d,y);
	adder5 fa5  (x,y,z);
	adder6 fa6  (z,e,sum);

endmodule

