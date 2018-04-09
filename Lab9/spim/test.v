`timescale 1ns / 1ps

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

	// Instantiate the Unit Under Test (UUT)
	main uut (
		clk, 
		led,
		cur,
		tmp
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		forever begin
			#2 clk <= ~clk;
		end
		// Add stimulus here
 
	end
      
endmodule

