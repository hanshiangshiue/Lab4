`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:11:03 08/19/2015 
// Design Name: 
// Module Name:    shifter 
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
module shifter(
    clk,
    rst_n,
	 d,
	 mode,
    q
    );


input clk;
input rst_n;
input d;
input mode;//mode=1:new input  mode=0:q[0] is input
output [7:0] q;

wire clk_out;
reg [7:0] q;


always@(posedge clk_out or negedge rst_n)
begin
	if(~rst_n)
	begin
		q<=8'b0101_0101;
	end
	else if(mode==0)
	begin
		q[0]<=q[1];
		q[1]<=q[2];
		q[2]<=q[3];
		q[3]<=q[4];
		q[4]<=q[5];
		q[5]<=q[6];
		q[6]<=q[7];
		q[7]<=q[0];
	end
	else
	begin
		q[0]<=q[1];
		q[1]<=q[2];
		q[2]<=q[3];
		q[3]<=q[4];
		q[4]<=q[5];
		q[5]<=q[6];
		q[6]<=q[7];
		q[7]<=d;
	end
end






freq_div f1(

	.clk_out(clk_out),
	//clk_ctl,
	.clk(clk),
	.rst_n(rst_n)
	);



endmodule
