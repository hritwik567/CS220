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
/*
opcode cnt-> 0 1           2 3     4 5    6 7   8 9  10 11
000          - <opcode> || <w add><   val    >
001          - <opcode> || <r add>
010          - <opcode> || <r add><r add>
011          - <opcode> || <r add><w add><   val   >
100          - <opcode> || <r add><r add><w add><   val   >
101          - <opcode> || <r add><r add><w add>
110          - <opcode> || <r add><r add><w add>
111          - <opcode> || <r add><s><w add>
*/
/*
display modes mode
0 blank
1 ADD\nVal (write)   wrAddr/wrData
2 ADD\nVal (read)    rdAddrA/rdDataA
3 Val\nVal (read/read) rdDataA/rdDataB
4 opcode is op
*/
//TODO:
//            LCD controller mode->result
//            adder/subtracter  @always (rdDataA+/-rdDataB)->result
//            shifter           @always (rdDataA<<shift)->shOut


module controller(
    input [3:0] in,
    input clk,
    input push_b,//pushbutton
    input rot_a,
    input rot_b,
        output wire LCD_RS,
    output wire LCD_E,
    output wire LCD_W,
    output wire [3:0]lcd_data
);

    reg rot_e, prev;
    reg [2:0] op;
    reg [4:0] cnt;

    reg [3:0] shift;
    reg [15:0] shOut;

    reg func=0;//add or subtract (rdDataA+rdDataB)
    wire [15:0] result;//adder/subtractor result

    reg write;
    reg [4:0] wrAddr, rdAddrA, rdAddrB;
    reg [15:0] wrData;
     wire  [15:0] rdDataA, rdDataB;

    //add-sub
    add_sub  as(rdDataA,rdDataB,func,result);

     regfile file(clk,write,wrAddr, wrData, rdAddrA, rdDataA, rdAddrB,rdDataB);
    //lcd
    reg [2:0]mode;
  top disp(clk,mode,wrAddr,wrData,rdAddrA,rdDataA,rdDataB,LCD_RS,LCD_E,LCD_W,lcd_data);

    initial begin
    wrAddr<=5'b0; rdAddrA<=5'b0; rdAddrB<=5'b0;
    wrData<=16'b0;// rdDataA<=16'b0; rdDataB<=16'b0;
        write<=1'b0;
    func<=1'b0;
    shOut<=16'b0;
    shift<=4'b0;
    cnt<=4'b0001;
    op<=3'b0;
    rot_e<=1'b0;
    prev<=1'b0;
    mode<=3'b0;
    end

    always@(posedge clk) begin
        //encoder
        if(rot_a & rot_b) begin
            rot_e <= 1;
        end else if(!rot_a & !rot_b) begin
            rot_e <= 0;
        end



        //functions
        if(push_b) begin
            cnt<=1;
            op<=3'b0;
            shift<=4'b0;mode<=3'b0;func=0;
              write<=0;
        end

        //shift
        shOut <= rdDataA << shift;

        //input
        prev <= rot_e;
        if(!prev & rot_e) begin
            if(cnt==0) begin
            end
            else if(cnt==1) begin
                //reset
                cnt<=1;
                op<=3'b0;
                shift<=0;
                mode<=3'b0;
                func=0;
                write<=0;
                //input
                op <= in[2:0];
                mode<=3'b100;//inform input taken
            end
            else if(cnt==2) begin
                case(op)
                    3'b000:wrAddr[3:0] <= in;
                    default:rdAddrA[3:0] <= in;
                endcase
            end
            else if(cnt==3) begin
                case(op)
                    3'b000:wrAddr[4] <= in[0];
                    default:rdAddrA[4] <= in[0];
                endcase
            end
            else if(cnt==4) begin
                case(op)
                    3'b000:wrData[3:0] <= in;
                    3'b001:begin
                                    mode<=3'b010;
                                end
                    3'b010:rdAddrB[3:0] <= in;
                    3'b011:wrAddr[3:0] <= in;
                    3'b100:rdAddrB[3:0] <= in;
                    3'b101:rdAddrB[3:0] <= in;
                    3'b110:rdAddrB[3:0] <= in;
                    3'b111:shift<=in;
                endcase
            end
            else if(cnt==5) begin
                case(op)
                    3'b000:wrData[7:4] <= in;
                    3'b001:cnt<=0;//done;
                    3'b010:rdAddrB[4] <= in[0];
                    3'b011:wrAddr[4] <= in[0];
                    3'b100:rdAddrB[4] <= in[0];
                    3'b101:rdAddrB[4] <= in[0];
                    3'b110:rdAddrB[4] <= in[0];
                    3'b111:wrAddr[3:0] <= in;
                endcase
            end
            else if(cnt==6) begin
                case(op)
                    3'b000:wrData[11:8] <= in;
                    3'b001:;
                    3'b010:begin
                                    mode<=3'b011;
                                end
                    3'b011:wrData[3:0] <= in;
                    3'b100:wrAddr[3:0] <= in;
                    3'b101://error;
                    3'b110://error;
                    3'b111:wrAddr[4] <= in[0];
                endcase
            end
            else if(cnt==7) begin
                case(op)
                    3'b000:wrData[15:12] <= in;
                    3'b001:;
                    3'b010:cnt<=0;//done;
                    3'b011:wrData[7:4] <= in;
                    3'b100:wrAddr[4] <= in[0];
                    3'b101:wrAddr[4] <= in[0];
                    3'b110:wrAddr[4] <= in[0];
                    3'b111:begin
                                    wrData<=shOut;mode<=3'b001;write<=1;
                                    end
                endcase
            end
            else if(cnt==8) begin
                case(op)
                    3'b000:begin
                                        mode<=3'b001;write<=1;
                                end
                    3'b001:;
                    3'b010:;
                    3'b011:wrData[11:8] <= in;
                    3'b100:wrData[3:0] <= in;
                    3'b101:func=0;
                    3'b110:func=1;
                    3'b111:cnt<=0;//done
                endcase
            end
            else if(cnt==9) begin
                case(op)
                    3'b000:cnt<=0;//done
                    3'b001:;
                    3'b010:;
                    3'b011:wrData[15:12] <= in;
                    3'b100:wrData[7:4] <= in;
                    3'b101:begin
                                wrData<=result;write<=1;mode<=3'b001;
                            end
                    3'b110:begin
                                wrData<=result;write<=1;mode<=3'b001;
                            end
                    3'b111:;
                endcase
            end
            else if(cnt==10) begin
                case(op)
                    3'b000:;
                    3'b001:;
                    3'b010:;
                    3'b011:begin mode<=3'b010;write<=1;
                                    end
                    3'b100:wrData[11:8] <= in;
                    3'b101:cnt<=0;//done
                    3'b110:cnt<=0;//done
                    3'b111:;
                endcase
            end
            else if(cnt==11) begin
                case(op)
                    3'b000:;
                    3'b001:;
                    3'b010:;
                    3'b011:cnt<=0;//done
                    3'b100:wrData[15:12] <= in;
                    3'b101:;
                    3'b110:;
                    3'b111:;
                endcase
            end
            else if(cnt==12) begin
                case(op)
                    3'b000:;
                    3'b001:;
                    3'b010:;
                    3'b011:;
                    3'b100:begin
                                    mode<=3'b011;write<=1;
                                    end
                    3'b101:;
                    3'b110:;
                    3'b111:;
                endcase
            end
				else if(cnt==13) begin
                case(op)
                    3'b000:;
                    3'b001:;
                    3'b010:;
                    3'b011:;
                    3'b100:cnt<=0;//done
                    3'b101:;
                    3'b110:;
                    3'b111:;
                endcase
            end
            cnt <= cnt + 1;
        end
    end
endmodule
