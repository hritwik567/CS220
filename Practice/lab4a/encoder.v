`timescale 1ns / 1ps

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
	end else if (rota==0&&rotb==0) begin
		dir=1'b0;
	end
end

endmodule
