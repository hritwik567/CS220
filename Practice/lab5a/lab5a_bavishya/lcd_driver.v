`include "complement_adder.v"
module (cor,s,op,f,last);

	wire [4:0]c;

	complement_adder uut1 (cor[0],s[0],op,op,f[0],c[0]);
	complement_adder uut2 (cor[1],s[1],c[0],op,f[1],c[1]);
	complement_adder uut3 (cor[2],0,c[1],op,f[2],c[2]);
	complement_adder uut4 (cor[3],0,c[2],op,f[3],c[3]);
	complement_adder uut5 (0,0,c[3],op,last,c[4]);

endmodule
