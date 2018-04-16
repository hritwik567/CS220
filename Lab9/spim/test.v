`timescale 1ns / 1ps
`include "main.v"
////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   16:06:46 04/09/2018
// Design Name:   main
// Module Name:   /users/btech/anay/Desktop/CS220/Lab9/spim/test.v
// Project Name:  spim
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: main
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg clk;

	// Outputs
	wire [7:0] led;
	wire [31:0] cur;
	wire [7:0] tmp;

	integer i,j;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.clk(clk),
		.led(led),
		.cur(cur),
		.regf(tmp)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		for(i=0;i<1000;i=i+1) begin//regfile
			#2 clk <= ~clk;

			if(i%2==0) begin
				$write("led =>%d\n",led);
				$write("Reg[4] =>%d\n",tmp);
				// for(j=7;j>=0;j=j-1) begin
				// $write("%d, ",led[j]);
				// end
				// $write("\n");
			end

		end

	end

endmodule
