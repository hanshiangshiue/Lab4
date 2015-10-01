`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:17:28 08/19/2015 
// Design Name: 
// Module Name:    nthuee_14seg 
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
module nthuee_14seg(
    alphabet,
    display
    );
	 
	 
	 input [3:0] alphabet;
	 output [14:0] display;
	 reg [14:0] display;
	 
	 
	 always @(alphabet)
		case (alphabet)
			4'd0: display = 15'b1001_0011_0111_101; //N
			4'd1: display = 15'b0111_1111_1011_011; //T
			4'd2: display = 15'b1001_0000_1111_111; //H
			4'd3: display = 15'b1000_0011_1111_111; //U
			4'd4: display = 15'b0110_0000_1111_111; //E
			4'd5: display = 15'b0110_0000_1111_111; //E
			default: display = 15'b1111_1111_1111_111;
		endcase



endmodule