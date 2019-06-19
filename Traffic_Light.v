`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineers: Soroush Mehraban & Amirhossein Amirfiroozkoohi
// 
// Create Date:    19:17:48 06/09/2019 
// Design Name: Traffic Light
// Module Name:    Traffic_Light 
// Description: a simple traffic light simulator
//////////////////////////////////////////////////////////////////////////////////
module Traffic_Light(SA,SB,A,B,PA,PB,CLK,RST);
	input SA,SB,CLK,RST;
	output [1:0] A,B,PA,PB;
	
	reg [1:0] A,B,PA,PB;//A and B are Car's light, PA and PB are People's light.
	reg[2:0] state;//current state
	reg [3:0] count;//counter 
	
	parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101, S6 = 3'b110;
	parameter RED = 2'b00, YELLOW = 2'b01, GREEN = 2'b10, BLINKING_RED = 2'b11;
	always @ (posedge CLK or RST)
		if(RST)
		begin
			state = S0;
			count <= 4'd0;
		end
		else
			case (state)
				S0:
				begin
					A = GREEN;
					B = RED;
					
					PA = RED; // NEW
					PB = GREEN; // NEW
					
					if(count < 4'd13)
						count <= count + 4'd1;
					else if (SB == 1'b1)
					begin
						count <= 4'd0;
						state = S1;
					end
				end
				S1:
				begin
					A = YELLOW;
					B = RED;
					
					PA = RED; // NEW
					PB = BLINKING_RED; // NEW
					
					if(count < 4'd4)
						count <= count +4'd1;
					else
						begin
						count <= 4'd0;
						state = S2;
						end
				end
				S2:
				begin
					A = RED;
					B = RED;
					
					PA = RED; // NEW 
					PB = BLINKING_RED; // NEW
					
					if(count < 4'd2)
						count <= count + 4'd1;
					else
						begin
						count <= 4'd0;
						state = S3;
						end
				end
				S3:
				begin
					A = RED;
					B = GREEN;
					
					PA = GREEN; // NEW
					PB = RED; // NEW
					
					if(count < 4'd13)
						count <= count + 4'd1;
					else if (SA == 1'b1)
						begin
						count <= 4'd0;
						state = S4;
						end
				end
				S4:
				begin
					A = RED;
					B = YELLOW;
					
					PA = BLINKING_RED; // NEW
					PB = RED; // NEW
					
					if(count < 4'd4)
						count <= count +4'd1;
					else
						begin
						count <= 4'd0;
						state = S5;
						end
				end
				S5:
				begin
					A = RED;
					B = RED;
					
					PA = BLINKING_RED; // NEW
					PB = RED; // NEW
					if(count < 4'd2)
						count <= count + 4'd1;
					else
						begin
						count <= 4'd0;
						state = S0;
						end
				end
			endcase
endmodule
