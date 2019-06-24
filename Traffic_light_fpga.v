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
	 
	 reg [7:0] count = 8'd0;
	 wire CLK;
	 
	 Traffic_Light TL (SA,SB,A,B,PA,PB,CLK,RST);
	 
	 always 
		begin
			if ( count < 8'd20000000 ) count <= count + 8'd1;
			else begin
				ClK = ~CLK;
				count <= 8'd0;
			end
		end

endmodule
