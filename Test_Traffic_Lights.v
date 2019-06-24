
module Test_Traffic_Lights;
	
	reg SA, SB; // Input, SA and SB are sensors
	reg CLK, RST;
	
	wire [1:0] PA, PB, A, B; // PA, PB are people's lights and A, B are car's lights
	
	Traffic_Light TL (SA,SB,A,B,PA,PB,CLK,RST);

	initial forever
		begin
		CLK = 0;
			
		repeat(100)
		#1 CLK = ~ CLK;
		end
	
	initial
		begin
		RST = 1;
		
		#2
		RST = 0;
		
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
