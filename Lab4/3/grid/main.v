`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:07:25 02/12/2018 
// Design Name: 
// Module Name:    main 
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

module main(clk,rot,aa,yi,led);

input clk,rot,aa;
input [3:0]yi;

output [7:0] led;
reg [7:0] led;

reg [3:0] x = 4'b0;
reg [3:0] y = 4'b0;
wire [3:0] x1, y1;

reg [1:0] dir;
reg [1:0] step0 = 2'b0;
reg [1:0] step1 = 2'b0;

always @(posedge clk) begin
	if (rot==1&&aa==1) 
	begin
		dir <= yi[3:2];
		if((dir==2'b0)||(dir==2'b01))
		begin
			step0 <= yi[1:0];
			step1 <= 2'b0;
		end 
		else if((dir==2'b10)||(dir==2'b10)) 
		begin
			step0 <= 2'b0;
			step1 <= yi[1:0];
		end 
		x = x1;
		y = y1;
		led[3:0]<=x;
		led[7:4]<=y;
	end 
end

move uut1 (x,step0,dir[0],x1);
move uut2 (y,step1,dir[0],y1);
endmodule
