`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:26:46 03/19/2018 
// Design Name: 
// Module Name:    regfile 
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
module regfile(
	input clk,
	input write,
	input [4:0] wrAddr,
	input [15:0] wrData,
	input readA,
	input [4:0] rdAddrA,
	output reg [15:0] rdDataA,
	input readB,
	input [4:0] rdAddrB,
	output reg [15:0] rdDataB
	);

	//regfile renamed to file, as it clashed with module name
	reg [15:0] file [0:31];
	initial begin
		file[0]=16'b0;file[1]=16'b0;file[2]=16'b0;file[3]=16'b0;file[4]=16'b0;
		file[5]=16'b0;file[6]=16'b0;file[7]=16'b0;file[8]=16'b0;file[9]=16'b0;
		file[10]=16'b0;file[11]=16'b0;file[12]=16'b0;file[13]=16'b0;file[14]=16'b0;
		file[15]=16'b0;file[16]=16'b0;file[17]=16'b0;file[18]=16'b0;file[19]=16'b0;
		file[20]=16'b0;file[21]=16'b0;file[22]=16'b0;file[23]=16'b0;file[24]=16'b0;
		file[25]=16'b0;file[26]=16'b0;file[27]=16'b0;file[28]=16'b0;file[29]=16'b0;
		file[30]=16'b0;file[31]=16'b0;
	end

	always @(posedge clk) begin
		if(readA) rdDataA <= file[rdAddrA];
	end

	always @(posedge clk) begin
		if(readB) rdDataB <= file[rdAddrB];
	end

	always @(posedge clk) begin
		if (write) file[wrAddr] <= wrData;
	end

	always @(posedge clk) begin
		if (wshift) file[wrAddr] <= shData;
	end

endmodule

