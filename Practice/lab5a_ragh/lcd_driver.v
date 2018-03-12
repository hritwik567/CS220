`timescale 1ns / 1ps
`define delay 20000000//100000?
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:21:59 03/07/2018
// Design Name:
// Module Name:    lcd_driver
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
module lcd_driver(line_a, line_b, clk, lrs, lw, le, data);
    input [127:0] line_a,line_b;

    input clk;
    output le,lw,lrs;
    output reg[3:0] data;
    reg le,lw,lrs;

    always @(posedge clk) begin
        //state of initialization step
            le=0;#delay
            {lrs,lw,data}=6'b000011;#delay
            le=1;#delay
            le=0;#delay
            {lrs,lw,data}=6'b000011;#delay
            le=1;#delay
            le=0;#delay
            {lrs,lw,data}=6'b000011;#delay
            le=1;#delay
            le=0;#delay
            {lrs,lw,data}=6'b000010;#delay
            le=1;#delay

        //configuration step,function set command
            le=0;#delay
            {lrs,lw,data}=6'b000010;#delay
            le=1;#delay
            le=0;#delay
            {lrs,lw,data}=6'b001000;#delay
            le=1;#delay

        //entry mode set command
              le=0;#delay
              {lrs,lw,data}=6'b000000;#delay
              le=1;#delay
              le=0;#delay
              {lrs,lw,data}=6'b000110;#delay
              le=1;#delay

        //Display on/off
              le=0;#delay
              {lrs,lw,data}=6'b000000;#delay
              le=1;#delay
              le=0;#delay
              {lrs,lw,data}=6'b001100;#delay
              le=1;#delay

        //Clear display
              le=0;#delay
              {lrs,lw,data}=6'b000000;#delay
              le=1;#delay
              le=0;#delay
              {lrs,lw,data}=6'b000001;#delay
              le=1;#delay

        //set DD RAM address#delay
              le=0;#delay
              {lrs,lw,data}=6'b001000;#delay
              le=1;#delay
              le=0;#delay
              {lrs,lw,data}=6'b000000;#delay
              le=1;#delay

        //first line display,16 write commands
          // 1st
              le=0;#delay
              {lrs,lw}=2'b10;
              data=line_a[127:124];#delay
              le=1;#delay
              le=0;#delay
              {lrs,lw}=2'b10;
              data=line_a[123:120];#delay
              le=1;#delay
          // 2nd
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[119:116];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[115:112];#delay
              le=1;#delay
          //3rd
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[111:108];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[107:104];#delay
              le=1;#delay
          // 4th
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[103:100];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[99:96];#delay
              le=1;#delay
          // 5th
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[95:92];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[91:88];#delay
              le=1;#delay
          // 6th
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[87:84];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[83:80];#delay
              le=1;#delay
          // 7th
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[79:76];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[75:72];#delay
              le=1;#delay
          // 8th
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[71:68];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[67:64];#delay
              le=1;#delay
          // 9th
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[63:60];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[59:56];#delay
              le=1;#delay
          // 10th
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[55:52];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[51:48];#delay
              le=1;#delay
          // 11th
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[47:44];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[43:40];#delay
              le=1;#delay
          // 12th
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[39:36];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[35:32];#delay
              le=1;#delay
          // 13th
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[31:28];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[27:24];#delay
              le=1;#delay
          // 14th
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[23:20];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[19:16];#delay
              le=1;#delay
          // 15th
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[15:12];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[11:8];#delay
              le=1;#delay
          // 16th
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[7:4];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_a[3:0];#delay
              le=1;#delay

        //DD RAM address Command
              le=0;#delay
              {lrs,lw,data}=6'b001100;#delay
              le=1;#delay
              le=0;#delay
              {lrs,lw,data}=6'b000000;#delay
              le=1;#delay

        //second line display,16 write commands
          // 1st
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[127:124];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[123:120];#delay
              le=1;#delay
          // 2nd
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[119:116];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[115:112];#delay
              le=1;#delay
          //3rd
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[111:108];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[107:104];#delay
              le=1;#delay
          // 4th
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[103:100];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[99:96];#delay
              le=1;#delay
          // 5th
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[95:92];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[91:88];#delay
              le=1;#delay
          // 6th
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[87:84];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[83:80];#delay
              le=1;#delay
          // 7th
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[79:76];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[75:72];#delay
              le=1;#delay
          // 8th
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[71:68];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[67:64];#delay
              le=1;#delay
          // 9th
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[63:60];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[59:56];#delay
              le=1;#delay
          // 10th
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[55:52];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[51:48];#delay
              le=1;#delay
          // 11th
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[47:44];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[43:40];#delay
              le=1;#delay
          // 12th
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[39:36];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[35:32];#delay
              le=1;#delay
          // 13th
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[31:28];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[27:24];#delay
              le=1;#delay
          // 14th
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[23:20];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[19:16];#delay
              le=1;#delay
          // 15th
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[15:12];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[11:8];#delay
              le=1;#delay
          // 16th
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[7:4];#delay
              le=1;#delay
              led=0;#delay
              {lrs,lw}=2'b10
              data=line_b[3:0];#delay
              le=1;#delay
              le=0;#delay
    end
endmodule
