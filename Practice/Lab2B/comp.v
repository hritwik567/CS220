`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:07:17 01/29/2018 
// Design Name: 
// Module Name:    comp 
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
module comp(a,b,p1,p2,p3,l1,l2,l3);
input a;
input b;

input p1;
input p2;
input p3;

output l1;
output l2;
output l3;

reg l1;
reg l2;
reg l3;

always @(a or b or p1 or p2 or p3) begin
  if(p1==1'b1) begin
    l1=1'b1;
    l2=1'b0;
    l3=1'b0;
  end
  else if(p2==1'b1) begin
    l1=1'b0;
    l2=1'b1;
    l3=1'b0;
  end
  else if(a<b) begin
    l1=1'b1;
    l2=1'b0;
    l3=1'b0;
  end
  else if(b<a) begin
    l1=1'b0;
    l2=1'b1;
    l3=1'b0;
  end
  else begin
    l1=1'b0;
    l2=1'b0;
    l3=1'b1;
  end
end

endmodule
