module(
	input [3:0] in,
	input clk,
	input rot_a,
	input rot_b,
	);

	reg rot_e, p_rot_e;
	reg op;
	reg [2:0] counter = 3'b0;

	reg readA, readB, write;
	reg [4:0] wrAddr, rdAddrA, rdAddrB;
	reg [15:0] wrData, rdDataA, rdDataB;

	always@(posedge clk) begin
		if(rot_a & rot_b) begin
			rot_e <= 1;
		end
		else if(!rot_a & !rot_b) begin
			rot_e <= 0;
		end
		p_rot_e <= rot_e;
		if(!p_rot_e & rot_e) begin
			if(counter==0) begin
				op <= in[2:0];
			end
			else if(counter==1) begin
				case(op):
					3'b0: wrAddr[3:0] <= in;
				endcase
			end
			else if(counter==2) begin
				case(op):
					3'b0: wrAddr[4] <= in[0];
				endcase
			end
			else if(counter==3) begin
				case(op):
					3'b0: wrData[3:0] <= in;
				endcase
			end
			else if(counter==4) begin
				case(op):
					3'b0: wrData[7:4] <= in;
				endcase
			end
			else if(counter==5) begin
				case(op):
					3'b0: wrData[11:8] <= in;
				endcase
			end
			else if(counter==6) begin
				case(op):
					3'b0: wrData[15:12] <= in;
				endcase
			end

			counter <= counter + 1;
		end

endmodule
