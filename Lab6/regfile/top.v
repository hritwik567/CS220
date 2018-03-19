`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:20:07 03/19/2018 
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
module top(
	input clk,
	input [2:0] mode,
	input [4:0] wa,
	input [15:0] wd,
	input [4:0] raA,
	input [15:0] rdA,
	input [4:0] raB,
	input [15:0] rdB,
	output wire LCD_RS,
	output wire LCD_E,
	output wire LCD_W,
	output wire [3:0] data
      );

  reg [127:0] LINE1={16{8'h20}};
  reg [127:0] LINE2={16{8'h20}};

  always @(posedge clk) begin
    if(mode==3'b000) begin
      LINE1 <= {16{8'h20}};
      LINE2 <= {16{8'h20}};
    end
    else if(mode==3'b001) begin
      LINE1 <= {{5{8'h20}},7'h18,wa[4],7'h18,wa[3],7'h18,wa[2],7'h18,wa[1],7'h18,wa[0],{6{8'h20}}};
      LINE2 <= {7'h18,wd[15],7'h18,wd[14],7'h18,wd[13],7'h18,wd[12],7'h18,wd[11],7'h18,wd[10],7'h18,wd[9],7'h18,wd[8],7'h18,wd[7],7'h18,wd[6],7'h18,wd[5],7'h18,wd[4],7'h18,wd[3],7'h18,wd[2],7'h18,wd[1],7'h18,wd[0]};
    end
    else if(mode==3'b010) begin
      LINE1 <= {{5{8'h20}},7'h18,raA[4],7'h18,raA[3],7'h18,raA[2],7'h18,raA[1],7'h18,raA[0],{6{8'h20}}};
      LINE2 <= {7'h18,rdA[15],7'h18,rdA[14],7'h18,rdA[13],7'h18,rdA[12],7'h18,rdA[11],7'h18,rdA[10],7'h18,rdA[9],7'h18,rdA[8],7'h18,rdA[7],7'h18,rdA[6],7'h18,rdA[5],7'h18,rdA[4],7'h18,rdA[3],7'h18,rdA[2],7'h18,rdA[1],7'h18,rdA[0]};
    end
    else if(mode==3'b011) begin
      LINE1 <= {7'h18,rdA[15],7'h18,rdA[14],7'h18,rdA[13],7'h18,rdA[12],7'h18,rdA[11],7'h18,rdA[10],7'h18,rdA[9],7'h18,rdA[8],7'h18,rdA[7],7'h18,rdA[6],7'h18,rdA[5],7'h18,rdA[4],7'h18,rdA[3],7'h18,rdA[2],7'h18,rdA[1],7'h18,rdA[0]};
      LINE2 <= {7'h18,rdB[15],7'h18,rdB[14],7'h18,rdB[13],7'h18,rdB[12],7'h18,rdB[11],7'h18,rdB[10],7'h18,rdB[9],7'h18,rdB[8],7'h18,rdB[7],7'h18,rdB[6],7'h18,rdB[5],7'h18,rdB[4],7'h18,rdB[3],7'h18,rdB[2],7'h18,rdB[1],7'h18,rdB[0]};
    end
  end

  lcd_driver uut(LINE1,LINE2,clk,LCD_RS,LCD_W,LCD_E,data);
endmodule
