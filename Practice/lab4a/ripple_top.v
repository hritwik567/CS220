`timescale 1ns / 1ps
`include "ripple.v"
`include "encoder.v"

module ripple_top;

	// Inputs
	reg clock,rota,rotb;

	wire rot,dir;
	wire [7:0]led;

	// Instantiate the Unit Under Test (UUT)
	encoder uut1 (
		.clk(clk),
		.rota(rota),
		.rotb(rotb),
		.rot(rot),
		.dir(dir)
	);
	ripple uut2 (
		.clk(clk),
		.rot(rot),
		.dir(dir),
		.led(led)
	);

	always @(rota or rotb)
	begin
		$display("time=%d: rota=%d, rotb=%d\n",$time,rota,rotb);
	end

	initial begin
		rota=0;rotb=0;
		#5
		rota=1;rotb=0;
		#5
		rota=1;rotb=1;
		#5
		rota=0;rotb=0;
		#5
		rota=0;rotb=1;
		#5
		rota=1;rotb=1;
		#5
		rota=0;rotb=0;
		#5
		$finish;
	end

endmodule
