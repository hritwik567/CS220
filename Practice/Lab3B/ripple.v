`timescale 1ns / 1ps
`define SHIFT_TIME 50000000

module ripple(clk, led0, led1, led2, led3, led4, led5, led6, led7);

input clk;

output led0, led1, led2, led3, led4, led5, led6, led7;

reg led0 = 1'b1;
reg led1, led2, led3, led4, led5, led6, led7;

reg [25:0] counter = 26'b0;

always @(posedge clk) begin
	counter <= counter + 1;
	if (counter == `SHIFT_TIME) begin
		led1 <= led0;
		led2 <= led1;
		led3 <= led2;
		led4 <= led3;
		led5 <= led4;
		led6 <= led5;
		led7 <= led6;
		led0 <= led7;
		counter <= 26'b0;
	end
end

endmodule
