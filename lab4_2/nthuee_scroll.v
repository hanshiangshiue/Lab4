`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:24:10 08/19/2015 
// Design Name: 
// Module Name:    nthuee_scroll 
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
module nthuee_scroll(

    clk,
	 rst_n,
	 ftsd_ctl,
	 display
	 );

input clk;
input rst_n;
output [3:0] ftsd_ctl;
output [14:0] display;

wire [3:0] alphabet;
wire clk_out;
wire [1:0] clk_ctl;
reg [3:0] a0,a1,a2,a3,a4,a5;




always@(posedge clk_out or negedge rst_n)
begin
	if(~rst_n)
	begin
		a0<=4'd0;
		a1<=4'd1;
		a2<=4'd2;
		a3<=4'd3;
		a4<=4'd4;
		a5<=4'd5;
	end
	else
	begin
		a0<=a1;
		a1<=a2;
		a2<=a3;
		a3<=a4;
		a4<=a5;
		a5<=a0;
	end
end





freq_div f1(
	.clk_out(clk_out),
	.clk_ctl(clk_ctl), // divided clock output
	.clk(clk), // global clock input
	.rst_n(rst_n) // active low reset
	);



scan_ctl s1(
	.ftsd_ctl(ftsd_ctl), // ftsd display control signal 
	.ftsd_in(alphabet), // output to ftsd display
	.in0(a0), // 1st input
	.in1(a1), // 2nd input
	.in2(a2), // 3rd input
	.in3(a3), // 4th input
	.ftsd_ctl_en(clk_ctl) // divided clock for scan control
	);


nthuee_14seg n1( 
	.display(display), // 14-segment display output
	.alphabet(alphabet) // BCD input
	);

endmodule
