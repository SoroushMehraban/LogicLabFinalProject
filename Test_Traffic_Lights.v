// test bench
`timescale 1ns / 1ps
module Test_Traffic_Lights;
	
	reg SA, SB; // Input, SA and SB are sensors
	parameter CLK, RST;
	
	wire [1:0] PA, PB, A, B; // PA, PB are people's lights and A, B are car's lights
	
	Traffic_Light(SA,SB,A,B,PA,PB,CLK,RST);

	initial
		begin
			CLK = 1;
			
			repeat(100):
			1# CLK = ~ CLK;
		end
	
	initial
		begin
		RST = 1;
		
		SA = 1'b1;
		SB = 1'b1;
		
		#32
		
		SA = 1'b0;
		SB = 1'b0;
		
		#14
		
		SA = 1'b1;
		
		#4
		
		SA = 1'b0;
		
		end
endmodule
		