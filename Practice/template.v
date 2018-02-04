`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:34:51 01/29/2018 
// Design Name: 
// Module Name:    seven_bit_adder 
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
module seven_bit_adder(y,pb1,pb2,pb3,pb4,sum,cout);
input [3:0]y;
input pb1;
input pb2;
input pb3;
input pb4;

output [6:0]sum;
output cout;

reg [6:0]a;
reg [6:0]b;

wire [6:0]sum;
wire cout; 

wire carry0;
wire carry1;
wire carry2;
wire carry3;
wire carry4;
wire carry5;

always @(posedge pb1) begin
  a[3:0] <= y;
end

always @(posedge pb2) begin
  a[6:4] <= y[2:0];
end

always @(posedge pb3) begin
  b[3:0] <= y;
end

always @(posedge pb4) begin
  b[6:4] <= y[2:0];
end

full_adder fa1 (a[0],b[0],1'b0,sum[0],carry0);
full_adder fa2 (a[1],b[1],carry0,sum[1],carry1);
full_adder fa3 (a[2],b[2],carry1,sum[2],carry2);
full_adder fa4 (a[3],b[3],carry2,sum[3],carry3);
full_adder fa5 (a[4],b[4],carry3,sum[4],carry4);
full_adder fa6 (a[5],b[5],carry4,sum[5],carry5);
full_adder fa7 (a[6],b[6],carry5,sum[6],cout);

endmodule
