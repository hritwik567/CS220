`include "adder5.v"
module move(cor,step,dir,out);

input [3:0]cor;
input [1:0]step; 
input dir;

output [3:0]out;
wire [3:0]out;

wire [3:0]oa;
wire last;

adder5 uut (cor,step,dir,oa,last);

assign out[0] = (oa[0]&(~last))|((~op)&last); 
assign out[1] = (oa[1]&(~last))|((~op)&last); 
assign out[2] = (oa[2]&(~last))|((~op)&last); 
assign out[3] = (oa[3]&(~last))|((~op)&last);

endmodule
