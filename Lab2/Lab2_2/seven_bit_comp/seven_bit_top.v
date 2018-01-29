`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:46:24 01/29/2018
// Design Name:   seven_bit
// Module Name:   /home/cse/Desktop/CS220/Lab2/Lab2_2/seven_bit_comp/seven_bit_top.v
// Project Name:  seven_bit_comp
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: seven_bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module seven_bit_top;
reg [3:0]y;
reg pb1;
reg pb2;
reg pb3;
reg pb4;
reg l0;
reg l1;
reg l2;

seven_bit uut (y,pb1,pb2,pb3,pb4,l0,l1,l2);


always @(pb1 or pb2 or pb3 or pb4)
begin
	$display("time=%d: y = %b, led0 = %b, led1 = %b, led2 =%b, pb1=%b,pb2=%b,pb3=%b,pb4=%b\n",$time,y,l0,l1,l2,pb1,pb2,pb3,pb4);
end


initial begin
	#5
	y=4'b0001;pb1=1;pb2=0;pb3=0;pb4=0;
	#5
	y=4'b0001;pb1=0;pb2=0;pb3=0;pb4=0;
	#5
	y=4'b0000;pb1=0;pb2=1;pb3=0;pb4=0;
	#5
	y=4'b0000;pb1=0;pb2=0;pb3=0;pb4=0;
	#5
	y=4'b0000;pb1=0;pb2=0;pb3=1;pb4=0;
	#5
	y=4'b0000;pb1=0;pb2=0;pb3=0;pb4=0;
	#5
	y=4'b0001;pb1=0;pb2=0;pb3=0;pb4=1;
	#5
	y=4'b0001;pb1=0;pb2=0;pb3=0;pb4=0;
	#5
	$finish;
end

endmodule

