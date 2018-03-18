`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:29:59 03/07/2018 
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
module top(clk,LCD_RS,LCD_E,LCD_W,data );
  output wire LCD_RS,LCD_E,LCD_W;
  output wire [3:0] data;
  input clk;
  reg [127:0] LINE1=128'h2057454C434F4D4520544F2043534520;
  reg [127:0] LINE2=128'h20492049204920204B414E5055522020;
  
  
  lcd_driver uut(LINE1,LINE2,clk,LCD_RS,LCD_W,LCD_E,data);
  
endmodule  
