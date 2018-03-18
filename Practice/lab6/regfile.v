module regfile(
	input clk,
	input write,
	input [4:0] wrAddr,
	input [15:0] wrData,
	input readA,
	input [4:0] rdAddrA,
	output reg [15:0] rdDataA,
	input readB,
	input [4:0] rdAddrB,
	output reg [15:0] rdDataB
	);

	reg [15:0] regfile [0:31];
//TODO: initialize all the registers to zero
	always @(posedge clk) begin
		if(readA) rdDataA <= regfile[rdAddrA];
	end

	always @(posedge clk) begin
		if(readB) rdDataB <= regfile[rdAddrB];
	end

	always @(posedge clk) begin
		if (write) regfile[wrAddr] <= wrData;
	end

endmodule
