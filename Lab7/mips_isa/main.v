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
	integer kk;
    reg [3:0] cnt;
    reg [2:0] r,i,j,c3,c4,c5,c6;
    reg [31:0] file [0:63];
    reg [31:0] data;

    initial begin
    led<=8'b11111111;
    cnt<=0;
    r<=0;i<=0;j<=0;
    c3<=0;c4<=0;c5<=0;c6<=0;
    file[0]<={6'h8,5'b0,5'b100,16'h3456};
    file[1]<={6'h8,5'b0,5'b101,16'hffff};
    file[2]<={6'h0,5'b101,5'b100,5'b110,5'b0,6'h20};
    file[3]<={6'h8,5'b0,5'b011,16'h7};
    file[4]<={6'h0,5'b110,5'b011,5'b110,5'b0,6'h4};//order?
    file[5]<={6'h0,5'b0,5'b011,5'b011,5'h01,6'h2};
    file[6]<={6'h23,5'b100,5'b101,16'h9abc};
    file[7]<={6'h2,26'h123456};

    for(kk=8;kk<64;kk=kk+1) begin
      file[kk]<=32'b0;
    end

    data<=0;
    end

    always@(posedge clk) begin

        //Terminated
      if(cnt==8) begin
          if(switch==0)begin
            led[2:0]<=r[2:0];
            led[5:3]<=i[2:0];
            led[7:6]<=j[1:0];
          end else begin
            led[1:0]<=c3[1:0];
            led[3:2]<=c4[1:0];
            led[5:4]<=c5[1:0];
            led[7:6]<=c6[1:0];
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

          //work on data
          if(data[31:26]==6'b000000) begin
            r=r+1;
            if(data[15:11]==5'b00011)begin
              c3=c3+1;
            end
            else if(data[15:11]==5'b00100) begin
              c4=c4+1;
            end
            else if(data[15:11]==5'b00101) begin
              c5=c5+1;
            end
            else if(data[15:11]==5'b00110) begin
              c6=c6+1;
            end
          end
          else if(data[31:26]==6'b000010)begin
            j=j+1;
          end
          else if(data[31:26]==6'b000011)begin
            j=j+1;
          end
          else begin
            i=i+1;
            if(data[20:16]==5'b00011)begin
              c3=c3+1;
            end
            else if(data[20:16]==5'b00100) begin
              c4=c4+1;
            end
            else if(data[20:16]==5'b00101) begin
              c5=c5+1;
            end
            else if(data[20:16]==5'b00110) begin
              c6=c6+1;
            end
          end

          cnt=cnt+1;
      end
    end
endmodule

