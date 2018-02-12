`timescale 1ns / 1ps
`include "ripple.v"
`include "encoder.v"

module adder5x4_top;

	// Inputs
	reg [3:0]y;
	reg pb1,pb2,pb3,pb4,rot;
	wire [6:0]sum;

	// Instantiate the Unit Under Test (UUT)
	ripple uut1 (
		.clk(clk),
		.rot(rot),
		.dir(dir),
		.led(led)
	);
  encoder uut2 (
		.clk(clk),
		.rota(rota),
		.rotb(rotb)
	);


	always @(pb1 or pb2 or pb3 or pb4)
	begin
		$display("time=%d: y = %b, sum = %b, pb1=%b,pb2=%b,pb3=%b,pb4=%b,rot=%b\n",$time,y,sum,pb1,pb2,pb3,pb4,rot);
	end

	initial begin
		y=4'b1111;pb1=1;pb2=0;pb3=0;pb4=0;rot=0;
		#5
		y=4'b1111;pb1=0;pb2=0;pb3=0;pb4=0;rot=0;
		#5
		y=4'b1111;pb1=0;pb2=1;pb3=0;pb4=0;rot=0;
		#5
		y=4'b1111;pb1=0;pb2=0;pb3=0;pb4=0;rot=0;
		#5
		y=4'b1111;pb1=0;pb2=1;pb3=1;pb4=0;rot=0;
		#5
		y=4'b1111;pb1=1;pb2=0;pb3=0;pb4=0;rot=0;
		#5
		y=4'b1111;pb1=0;pb2=0;pb3=0;pb4=1;rot=0;
		#5
		y=4'b1111;pb1=0;pb2=1;pb3=0;pb4=0;rot=0;
		#5
		y=4'b1111;pb1=0;pb2=0;pb3=0;pb4=0;rot=1;
		#5
		y=4'b1111;pb1=0;pb2=1;pb3=0;pb4=0;rot=0;
		#5
		$finish;
	end

endmodule
