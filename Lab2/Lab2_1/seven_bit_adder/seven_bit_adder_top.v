`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:51:57 01/29/2018
// Design Name:   seven_bit_adder
// Module Name:   /home/cse/Desktop/CS220/Lab2/Lab2_1/seven_bit_adder/seven_bit_adder_top.v
// Project Name:  seven_bit_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: seven_bit_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module seven_bit_adder_top;

	// Inputs
	reg [3:0] y;
	reg pb1;
	reg pb2;
	reg pb3;
	reg pb4;
	wire [6:0]sum,cout;
	// Instantiate the Unit Under Test (UUT)
	seven_bit_adder uut (
		.y(y), 
		.pb1(pb1), 
		.pb2(pb2), 
		.pb3(pb3), 
		.pb4(pb4),
		.sum(sum),
		.cout(cout)
	);


	always @(pb1 or pb2 or pb3 or pb4)
	begin
		$display("time=%d: y = %b, sum = %b, carry = %b, pb1=%b,pb2=%b,pb3=%b,pb4=%b\n",$time,y,sum,cout,pb1,pb2,pb3,pb4);
	end


	initial begin
		y[0]=0;y[1]=0;y[2]=0;y[3]=1;pb1=1;pb2=0;pb3=0;pb4=0;
		#5
		y[0]=0;y[1]=0;y[2]=0;y[3]=1;pb1=0;pb2=0;pb3=0;pb4=0;
		#5
		y[0]=0;y[1]=0;y[2]=0;y[3]=0;pb1=0;pb2=1;pb3=0;pb4=0;
		#5
		y[0]=0;y[1]=0;y[2]=0;y[3]=0;pb1=0;pb2=0;pb3=0;pb4=0;
		#5
		y[0]=0;y[1]=0;y[2]=0;y[3]=1;pb1=0;pb2=0;pb3=1;pb4=0;
		#5
		y[0]=0;y[1]=0;y[2]=0;y[3]=1;pb1=0;pb2=0;pb3=0;pb4=0;
		#5
		y[0]=0;y[1]=0;y[2]=0;y[3]=0;pb1=0;pb2=0;pb3=0;pb4=1;
		#5
		y[0]=0;y[1]=0;y[2]=0;y[3]=0;pb1=0;pb2=0;pb3=0;pb4=0;
		#5
		$finish;
	end
      
endmodule

