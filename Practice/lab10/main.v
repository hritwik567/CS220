`timescale 1ns / 1ps
`define MAX_PC 11
`define OUTPUT_REG 4
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
    output reg [7:0]led
);
    reg [3:0] cnt,pc;
    integer kk;
    reg [7:0] mem [0:2];
    reg [8:0] regfile [0:31];
    reg [31:0] op [0:10];

    reg [31:0] cur;
    //address
    reg [4:0] sa1,sa2,da;
    //values
    reg [7:0] s1,s2,res,im;
    reg inval;

    initial begin
      led<=8'b11111111;
      cnt<=0;pc<=0;
      cur<=32'b0;

      sa1<=5'b0;sa2<=5'b0;da<=5'b0;
      s1<=8'b0;s2<=8'b0;res<=8'b0;im<=8'b0;

      //memory
      mem[0] = -20;
      mem[1] = 10;
      mem[2] = 2;

      //op code
      op[0] = {6'h23, 5'h00, 5'h01, 16'h0000} //load a
      op[1] = {6'h23, 5'h00, 5'h02, 16'h0001} //load b
      op[2] = {6'h23, 5'h00, 5'h03, 16'h0002} //load c
      op[3] = {6'h09, 5'h00, 5'h04, 16'h0000} //initialize sum
      op[4] = {6'h09, 5'h01, 5'h05, 16'h0000} //for loop start i=a
      op[5] = {6'h00, 5'h05, 5'h02, 5'h06, 5'h00, 6'h2a} // i<b?1:0
      op[6] = {6'h04, 5'h06, 5'h00, 16'h0005} //beq
      op[7] = {6'h00, 5'h04, 5'h05, 5'h04, 5'h00, 6'h21} // sum = sum+i
      op[8] = {6'h00, 5'h05, 5'h05, 5'h03, 5'h00, 6'h21} // i = i + c
      op[9] = {6'h00, 5'h05, 5'h02, 5'h06, 5'h00, 6'h2a} // i<b?1:0
      op[10] = {6'h04, 5'h06, 5'h00, 16'hfffd} //bne

      for(kk=0;kk<32;kk=kk+1) begin//regfile
        regfile[kk]<=8'b0;
      end
    end

    always@(posedge clk) begin

      //fsm
      if(cnt==0) begin
        //read instruction
        cur=regfile[pc];
        cnt<=cnt+1;
      end
      else if(cnt==1) begin
        //get fields of instruction
        if(cur[31:26]==6'b000000) begin//r format
          sa1<=cur[25:21];
          sa2<=cur[20:16];
          da<=cur[15:11];
        end
        else begin//i format
          sa1<=cur[25:21];
          da<=cur[20:16];
          im<=cur[7:0];
        end

        cnt<=cnt+1;
      end
      else if(cnt==2) begin
        //read source register
        s1<=regfile[sa1];
        s2<=regfile[sa2];
        cnt<=cnt+1;
      end
      else if(cnt==3) begin
        //execute instruction, if the instruction is lw, its address is computed
        if(cur[31:26]==6'b000000) begin//r format
          if(cur[5:0]==6'h21) begin//addu
            res<=s1+s2;
          end
          if(cur[5:0]==6'h2a) begin//slt
            res<=(s1<s2)?1:0;
          end
        end//i format
        else begin
          if(cur[31:26]==6'h23) begin//lw

          end
          else if(cur[31:26]==6'h09) begin//addiu
            res<=s1+im;
          end
          else if(cur[31:26]==6'h04) begin//beq
            pc<=(s1==s2)?pc+im:pc;
          end
          else if(cur[31:26]==6'h05) begin//bne
            pc<=(s1!=s2)?pc+im:pc;
          end
          else begin
            inval<=1;
          end
        end
        cnt<=cnt+1;
      end
      else if(cnt==4) begin
        //accesses data memory if the instruction is lw and reads the row pointed to by the address computed in the last state
        if(cur[31:26]==6'h23) begin//lw
          res<=mem[im+s1];
        end
        //rest do nothing

        cnt<=cnt+1;
      end
      else if(cnt==5) begin
        //writes the result of the instruction to the destination register

        //if destination!=0
        if(da!=5'b0&&inval==0) begin
          regfile[da]<=mem[im+s1];
        end

        pc=pc+1;

        if(pc<`MAX_PC) begin
          cnt<=0;
        end
        else begin
          cnt<=cnt+1;
        end
      end
      else if(cnt==6) begin
        //show output
        led<=regfile[`OUTPUT_REG];
      end

    end
endmodule
