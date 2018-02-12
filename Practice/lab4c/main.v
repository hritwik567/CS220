`include "move.v"

module main(clk,rot,y,led);

input clk,rot;
input [3:0]y;

output [7:0] led;
reg [7:0] led;

reg [3:0] x = 4'b0;
reg [3:0] y = 4'b0;
reg [1:0] dir;
reg [1:0] step0 = 2'b0;
reg [1:0] step1 = 2'b0;
reg [1:0] step2 = 2'b0;
reg [1:0] step3 = 2'b0;

always @(posedge clk) begin
	if (rot==1) 
	begin
		dir <= y[3:2];
		if(dir==2'b0)
		begin
			step0 <= y[1:0];
			step1 <= 2'b0;
			step2 <= 2'b0;
			step3 <= 2'b0;
		end else if(dir==2'b01)
		begin
			step0 <= 2'b0;
			step1 <= y[1:0];
			step2 <= 2'b0;
			step3 <= 2'b0;
		end else if(dir==2'b10) 
		begin
			step0 <= 2'b0;
			step1 <= 2'b0;
			step2 <= y[1:0];
			step3 <= 2'b0;
		end else if(dir==2'b11) 
		begin
			step0 <= 2'b0;
			step1 <= 2'b0;
			step2 <= 2'b0;
			step3 <= y[1:0];
		end
		led[0] <= x[0];
		led[1] <= x[1];
		led[2] <= x[2];
		led[3] <= x[3];
		led[4] <= y[0];
		led[5] <= y[1];
		led[6] <= y[2];
		led[7] <= y[3];
	end 
end

			move uut1 (x,step0,dir[0],x);
			move uut2 (x,step1,dir[0],x);
			move uut3 (y,step2,dir[0],x);
			move uut4 (y,step3,dir[0],x);
endmodule

