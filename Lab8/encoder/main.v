`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    14:21:19 03/19/2018
// Design Name:
// Module Name:    controller
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

//TODO:
//            LCD controller mode->result
//            adder/subtracter  @always (rdDataA+/-rdDataB)->result
//            shifter           @always (rdDataA<<shift)->shOut


module main(
    input clk,
    input switch,
    output reg [7:0]led
);
    reg [3:0] cnt,count_one;
    reg [7:0] sum,last_one;
    reg [15:0] file [0:7];
    reg [15:0] data;

    initial begin
    led<=8'b11111111;

    file[0] = 16'h0000;
    file[1] = 16'h8800;
    file[2] = 16'h0100;
    file[3] = 16'h8000;
    file[4] = 16'h0001;
    file[5] = 16'h0800;
    file[6] = 16'h8110;
    file[7] = 16'h0080;

    data<=0;count_one<=0;last_one<=0;
    sum<=0;
    end

    always@(posedge clk) begin

        //Terminated
      if(cnt==8) begin
          if(switch==0)begin
            led<=sum;
          end else begin
            led[7:1]<=7'b0;
            led[0]<=sum[0]^sum[1]^sum[2]^sum[3]^sum[4]^sum[5]^sum[6]^sum[7];
          end
      end
      else begin
          //input
          if(cnt==0) begin
            data=file[0];
          end
          else if(cnt==1) begin
            data=file[1];
          end
          else if(cnt==2) begin
            data=file[2];
          end
          else if(cnt==3) begin
            data=file[3];
          end
          else if(cnt==4) begin
            data=file[4];
          end
          else if(cnt==5) begin
            data=file[5];
          end
          else if(cnt==6) begin
            data=file[6];
          end
          else if(cnt==7) begin
            data=file[7];
          end

          count_one=8'b0;
          last_one=8'b0;

          count_one=data[0]+data[1]+data[2]+data[3]+data[4]+data[5]+data[6]+data[7]+data[8]+data[9]+data[10]+data[11]+data[12]+data[13]+data[14]+data[15];
          last_one=1*data[1]+2*data[2]+3*data[3]+4*data[4]+5*data[5]+6*data[6]+7*data[7]+8*data[8]+9*data[9]+10*data[10]+11*data[11]+12*data[12]+13*data[13]+14*data[14]+15*data[15];
          // if(data[0]==1) begin
          //   count_one<=count_one+1;
          //   last_one<=0;
          // end
          // if(data[1]==1) begin
          //   count_one<=count_one+1;
          //   last_one<=1;
          // end
          // if(data[2]==1) begin
          //   count_one<=count_one+1;
          //   last_one<=2;
          // end
          // if(data[3]==1) begin
          //   count_one<=count_one+1;
          //   last_one<=3;
          // end
          // if(data[4]==1) begin
          //   count_one<=count_one+1;
          //   last_one<=4;
          // end
          // if(data[5]==1) begin
          //   count_one<=count_one+1;
          //   last_one<=5;
          // end
          // if(data[6]==1) begin
          //   count_one<=count_one+1;
          //   last_one<=6;
          // end
          // if(data[7]==1) begin
          //   count_one<=count_one+1;
          //   last_one<=7;
          // end
          // if(data[8]==1) begin
          //   count_one<=count_one+1;
          //   last_one<=8;
          // end
          // if(data[9]==1) begin
          //   count_one<=count_one+1;
          //   last_one<=9;
          // end
          // if(data[10]==1) begin
          //   count_one<=count_one+1;
          //   last_one<=10;
          // end
          // if(data[11]==1) begin
          //   count_one<=count_one+1;
          //   last_one<=11;
          // end
          // if(data[12]==1) begin
          //   count_one<=count_one+1;
          //   last_one<=12;
          // end
          // if(data[13]==1) begin
          //   count_one<=count_one+1;
          //   last_one<=13;
          // end
          // if(data[14]==1) begin
          //   count_one<=count_one+1;
          //   last_one<=14;
          // end
          // if(data[15]==1) begin
          //   count_one<=count_one+1;
          //   last_one<=15;
          // end

          if(count_one>1 || count_one==0) begin
            if(sum==8'h00) begin
              sum<=8'b11111111;
            end
            else begin
              sum<=sum-1;
            end
          end
          else begin
              sum<=sum+last_one;
          end

          cnt<=cnt+1;
      end
    end
endmodule
