module add-sub(
	input [15:0] d_1,
	input [15:0] d_2,
	input sign,
	output reg [15:0] out
	);

	wire [15:0] c;

	complement_adder ca1 (d_1[0],d_2[0],sign,sign,out[0],c[0]);
	complement_adder ca2 (d_1[1],d_2[1],c[0],sign,out[1],c[1]);
	complement_adder ca3 (d_1[2],d_2[2],c[1],sign,out[2],c[2]);
	complement_adder ca4 (d_1[3],d_2[3],c[2],sign,out[3],c[3]);
	complement_adder ca5 (d_1[4],d_2[4],c[3],sign,out[4],c[4]);
	complement_adder ca6 (d_1[5],d_2[5],c[4],sign,out[5],c[5]);
	complement_adder ca7 (d_1[6],d_2[6],c[5],sign,out[6],c[6]);
	complement_adder ca8 (d_1[7],d_2[7],c[6],sign,out[7],c[7]);
	complement_adder ca9 (d_1[8],d_2[8],c[7],sign,out[8],c[8]);
	complement_adder ca10 (d_1[9],d_2[9],c[8],sign,out[9],c[9]);
	complement_adder ca11 (d_1[10],d_2[10],c[9],sign,out[10],c[10]);
	complement_adder ca12 (d_1[11],d_2[11],c[10],sign,out[11],c[11]);
	complement_adder ca13 (d_1[12],d_2[12],c[11],sign,out[12],c[12]);
	complement_adder ca14 (d_1[13],d_2[13],c[12],sign,out[13],c[13]);
	complement_adder ca15 (d_1[14],d_2[14],c[13]sign,out[14],c[14]);
	complement_adder ca16 (d_1[15],d_2[15],c[14]sign,out[15],c[15]);

endmodule

