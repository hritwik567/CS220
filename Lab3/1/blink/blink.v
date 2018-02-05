`timescale 1ns / 1ps
`define OFF_TIME 25000000
`define ON_TIME (`OFF_TIME*2)
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:19:26 02/05/2018 
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

	always @(posedge clk)begin
	cnt <= cnt+1;
		if (led==1'b0 ) begin
			if (cnt== `ON_TIME) begin
				led <= 1'b1;	
				cnt <= 27'b0;
			end
		end
		else if(led==1'b1) begin
			if(cnt== `OFF_TIME) begin
				led <= 1'b0;	
				cnt <= 27'b0;
			end
		end
	end
endmodule
