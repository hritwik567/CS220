`timescale 1ns / 1ps
`include "move.v"
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

module main(clk,rot,rdir,yi,led);

input clk,rot,rdir;
input [3:0]yi;

output reg [7:0] led;

reg [3:0] x=4'b0,y=4'b0;
wire [3:0] x1,y1;

reg [1:0] dir,sx=2'b0,sy=2'b0;
reg prev=1,opx=0,opy=0;

always @(posedge clk) begin
	prev<=rot;
	if (prev==0&&rot==1)begin
		x=x1;y=y1;
		led[3:0]<=x;
		led[7:4]<=y;

		if(yi[3]==0)begin
			sx<=yi[1:0];
			sy<=2'b0;
			opx=yi[2];opy=0;
		end else if(yi[3]==1) begin
			sx<=2'b0;
			sy<=yi[1:0];
			opx=0;opy=yi[2];
		end
	end
end

move mv1 (clk,x,sx,opx,x1);
move mv2 (clk,y,sy,opy,y1);
endmodule
