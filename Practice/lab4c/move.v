


module move(y,clk,rot,dir,sum);

input [3:0]y;
input clk,rot,dir;

output [7:0]sum;
wire [7:0]sum;
wire [6:0]carry;

reg prev=1'b1,op;
reg [2:0]cnt=3'b0;
reg [6:0]a,b;




always @(posedge clk) begin
	if(rot==1) begin
		
	end
end

