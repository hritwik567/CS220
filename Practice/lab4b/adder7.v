`timescale 1ns / 1ps
`include "full_adder.v"

module adder7(y,clk,rot,dir,sum);

input [3:0]y;
input clk,rot,dir;

output [7:0]sum;
wire [7:0]sum;
wire [5:0]carry;

reg prev=1'b1,op;
reg [2:0]cnt=3'b0;
reg [6:0]a,b;

always @(posedge clk) begin
	prev<=rot;
	if(prev==0 && rot==1 && dir==1) begin
		cnt <= cnt+1;
		if (cnt==3'b001) begin
			a[3:0]<=y;
		end else if (cnt==3'b010) begin
			a[6:4]<=y[2:0];
		end else if (cnt==3'b011) begin
			b[3:0]<=y;
		end else if (cnt==3'b100) begin
			b[6:4]<=y[2:0];
		end else if (cnt==3'b101) begin
			op<=y[0];
		end else if (cnt==3'b110) begin
			cnt<=0;
		end
	end
end

full_adder uut1 (a[0],b[0],op,sum[0],carry[0]);
full_adder uut2 (a[1],b[1],carry[0],sum[1],carry[1]);
full_adder uut3 (a[2],b[2],carry[1],sum[2],carry[2]);
full_adder uut4 (a[3],b[3],carry[2],sum[3],carry[3]);
full_adder uut5 (a[4],b[4],carry[3],sum[4],carry[4]);
full_adder uut6 (a[5],b[5],carry[4],sum[5],carry[5]);
full_adder uut7 (a[6],b[6],carry[5],sum[6],sum[7]);
endmodule
