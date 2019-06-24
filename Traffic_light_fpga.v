`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:45:56 06/24/2019 
// Design Name: 
// Module Name:    Traffic_light_fpga 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ms / 1us
module Traffic_light_fpga(
    input SA,
    input SB,
    output A,
    output B,
    output PA,
    output PB,
    input CLK,
    input RST
    );
	 
	 reg count = 8'd0;
	 reg TL_CLK = 1'b0;
	 
	 reg [1:0] A = 2'b10;
	 reg [1:0] PB = 2'b10;
	 reg [1:0] B = 2'b00;
	 reg [1:0] PA = 2'b00;
	 
	 Traffic_Light TL (SA,SB,A,B,PA,PB,TL_CLK,RST);
	 
	 always @ (CLK)
		begin
			if ( count < 8'd20000000 ) count <= count + 8'd1;
			else begin
				TL_CLK = ~TL_CLK;
				count <= 8'd0;
			end
		end

endmodule
