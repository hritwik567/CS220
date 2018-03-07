`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:03:10 02/12/2018 
// Design Name: 
// Module Name:    move 
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
module move(clk,pos,step,op,out);

input [3:0]pos;
input [1:0]step;
input op, clk;

output reg [3:0]out;

wire [3:0]tmp;
wire last;

adder5 add5 (pos,step,op,tmp,last);

always@(posedge clk) begin
	if(op==0&&last==1)begin
		out<=4'b1111;
	end else if(op==1&&last==0) begin
		out<=4'b0;
	end else begin
		out<=tmp;
	end
end

endmodule