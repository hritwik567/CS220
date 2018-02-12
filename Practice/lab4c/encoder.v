
module encoder(clk,rota,rotb,y,led);

input clk,rota,rotb;
input [3:0]y;

output [7:0]led;
wire [7:0]led;
reg [3:0]x = 4b'0;
reg [3:0]y = 4b'0;

wire [3:0]out;

always @(posedge clk) begin
	if (rota==1&&rotb==1) 
	begin
		x <= move(x,y[1:0],y[3:2],out)
	end 
	else if (rota==0&&rotb==0) 
	begin
		rot=1'b0;
	end 
end

endmodule

