`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:06:31 02/12/2018 
// Design Name: 
// Module Name:    encoder 
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

module encoder(clk,rota,rotb,rot,dir);

input clk,rota,rotb;
output rot,dir;
reg rot=1'b0,dir=1'b0;

always @(posedge clk) begin
	if (rota==1&&rotb==1) begin
		rot=1'b1;
	end else if (rota==0&&rotb==0) begin
		rot=1'b0;
	end else if (rota==1&&rotb==0) begin
		dir=1'b1;
	end else if (rota==0&&rotb==1) begin
		dir=1'b0;
	end
end

endmodule
