module(
	input [3:0] in,
	input clk,
	input pb,//pushbutton
	input rot_a,
	input rot_b,
	);

	reg rot_e, prev;
	reg [2:0] op;
	reg [2:0] cnt = 3'b0;

	reg [3:0] shift;

	reg readA, readB, write;
	reg [4:0] wrAddr, rdAddrA, rdAddrB;
	reg [15:0] wrData, rdDataA, rdDataB;

	always@(posedge clk) begin

		if(rot_a & rot_b) begin
			rot_e <= 1;
		end else if(!rot_a & !rot_b) begin
			rot_e <= 0;
		end

		if(pb) begin
			cnt=0;
			//reset
		end

		prev <= rot_e;

		if(!prev & rot_e) begin
			op <= in[2:0];
			if(cnt==0) begin
				op <= in[2:0];
			end else if(cnt==1) begin
				case(op):
					3'b000:wrAddr[3:0] <= in;
					default:rdAddrA[3:0] <= in;
				endcase
			end else if(cnt==2) begin
				case(op):
					3'b000:wrAddr[4] <= in[0];
					default:rdAddrA[4] <= in[0];
				endcase
			end else if(cnt==3) begin
				case(op):
					3'b000:wrData[3:0] <= in;
					3'b001://dosomething cnt<=10;
					3'b010:rdAddrB[3:0] <= in;
					3'b011:wrAddr[3:0] <= in;
					3'b100:rdAddrB[3:0] <= in;
					3'b101:rdAddrB[3:0] <= in;
					3'b110:rdAddrB[3:0] <= in;
					3'b111:shift<=in;
				endcase
			end else if(cnt==4) begin
				case(op):
					3'b000:wrData[7:4] <= in;
					3'b001:
					3'b010:rdAddrB[4] <= in[0];
					3'b011:wrAddr[4] <= in[0];
					3'b100:rdAddrB[4] <= in[0];
					3'b101:rdAddrB[4] <= in[0];
					3'b110:rdAddrB[4] <= in[0];
					3'b111:wrAddr[3:0] <= in;
				endcase
			end else if(cnt==5) begin
				case(op):
					3'b000:wrData[11:8] <= in;
					3'b001:
					3'b010://dosomething cnt<=10;
					3'b011:wrData[3:0] <= in;
					3'b100:wrAddr[3:0] <= in;
					3'b101:
					3'b110:
					3'b111:wrAddr[4] <= in[0];
				endcase
			end else if(cnt==6) begin
				case(op):
					3'b000:wrData[15:12] <= in;
					3'b001:
					3'b010:
					3'b011:wrData[7:4] <= in;
					3'b100:wrAddr[4] <= in[0];
					3'b101:wrAddr[4] <= in[0];
					3'b110:wrAddr[4] <= in[0];
					3'b111://dosomethingcnt<=10
				endcase
			end
			end else if(cnt==7) begin
				case(op):
					3'b000://dosomething cnt<=10;
					3'b001:
					3'b010:
					3'b011:wrData[11:8] <= in;
					3'b100:wrData[3:0] <= in;
					3'b101://dosomethingcnt<=10;
					3'b110://dosomethingcnt<=10;
					3'b111:
				endcase
			end
			end else if(cnt==8) begin
				case(op):
					3'b000:
					3'b001:
					3'b010:
					3'b011:wrData[15:12] <= in;
					3'b100:wrData[7:4] <= in;
					3'b101:
					3'b110:
					3'b111:
				endcase
			end
			end else if(cnt==9) begin
				case(op):
					3'b000:
					3'b001:
					3'b010:
					3'b011://dosomethingcnt<=10;
					3'b100:wrData[11:8] <= in;
					3'b101:
					3'b110:
					3'b111:
				endcase
			end
			end else if(cnt==10) begin
				case(op):
					3'b000:
					3'b001:
					3'b010:
					3'b011:
					3'b100:wrData[15:12] <= in;
					3'b101:
					3'b110:
					3'b111:
				endcase
			end
			end else if(cnt==10) begin
				case(op):
					3'b000:
					3'b001:
					3'b010:
					3'b011:
					3'b100://dosomethingcnt<=10
					3'b101:
					3'b110:
					3'b111:
				endcase
			end
			cnt <= cnt + 1;

			if(cnt==11) begin
				#5cnt<=0;
				//reset, cnt, opcode, addresses, shift, value
			end
		end

endmodule
