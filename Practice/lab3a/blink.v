`timescale 1ns / 1ps
`define OFF_TIME 25000000
`define ON_TIME (`OFF_TIME*2)
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:07:17 01/29/2018 
// Design Name: 
// Module Name:    blink 
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
module blink(clk,led);
input clk;
output reg led;
reg [26:0]cnt=27'b0;

always @(posedge clk) begin
	cnt<=cnt+1;
end

always @(posedge cnt) begin
	if (cnt==`ON_TIME) begin
		cnt<=27'b0;
		led<=1'b0;
	end else if(cnt==`OFF_TIME) begin
		cnt<=cnt;
		led<=1'b1;
	end
end

endmodule
