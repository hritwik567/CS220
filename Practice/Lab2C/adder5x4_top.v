`timescale 1ns / 1ps
`include "adder5x4.v"
////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   14:51:57 01/29/2018
// Design Name:   adder5x4
// Module Name:   /home/cse/Desktop/CS220/Lab2/Lab2_1/adder5x4/adder5x4_top.v
// Project Name:  adder5x4
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: adder5x4
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module adder5x4_top;

	// Inputs
	reg [3:0]y;
	reg pb1,pb2,pb3,pb4,rot;
	wire [6:0]sum;

	// Instantiate the Unit Under Test (UUT)
	adder5x4 uut (
		.yi(y),
		.pb1(pb1),
		.pb2(pb2),
		.pb3(pb3),
		.pb4(pb4),
		.rot(rot),
		.sum(sum)
	);


	always @(pb1 or pb2 or pb3 or pb4)
	begin
		$display("time=%d: y = %b, sum = %b, pb1=%b,pb2=%b,pb3=%b,pb4=%b,rot=%b\n",$time,y,sum,pb1,pb2,pb3,pb4,rot);
	end

	initial begin
		y=4'b1111;pb1=1;pb2=0;pb3=0;pb4=0;rot=0;
		#5
		y=4'b1111;pb1=0;pb2=0;pb3=0;pb4=0;rot=0;
		#5
		y=4'b1111;pb1=0;pb2=1;pb3=0;pb4=0;rot=0;
		#5
		y=4'b1111;pb1=0;pb2=0;pb3=0;pb4=0;rot=0;
		#5
		y=4'b1111;pb1=0;pb2=1;pb3=1;pb4=0;rot=0;
		#5
		y=4'b1111;pb1=1;pb2=0;pb3=0;pb4=0;rot=0;
		#5
		y=4'b1111;pb1=0;pb2=0;pb3=0;pb4=1;rot=0;
		#5
		y=4'b1111;pb1=0;pb2=1;pb3=0;pb4=0;rot=0;
		#5
		y=4'b1111;pb1=0;pb2=0;pb3=0;pb4=0;rot=1;
		#5
		y=4'b1111;pb1=0;pb2=1;pb3=0;pb4=0;rot=0;
		#5
		$finish;
	end

endmodule
