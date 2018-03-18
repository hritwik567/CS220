`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:02:33 03/05/2018
// Design Name:   LCD_top
// Module Name:   C:/Users/Vishad Viplav/Documents/CS 220/lab5/lab5_1/simulation.v
// Project Name:  lab5_1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LCD_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module simulation;

	// Inputs
	reg clk;

	// Outputs
	wire LCD_RS;
	wire LCD_E;
	wire LCD_W;
	wire [3:0] data;

	// Instantiate the Unit Under Test (UUT)
	LCD_top uut (
		.clk(clk), 
		.LCD_RS(LCD_RS), 
		.LCD_E(LCD_E), 
		.LCD_W(LCD_W), 
		.data(data)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
      forever
		#1 clk=~clk;
		// Wait 100 ns for global reset to finish
		        
		// Add stimulus here

	end
      
endmodule

