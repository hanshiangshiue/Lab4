`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:20:25 08/19/2015 
// Design Name: 
// Module Name:    shifters 
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
module shifters(
    clk,
	 rst_n,
	 ftsd_ctl,
	 display,
	 direction,
	 mode1,
	 mode2,
	 mode3
	 );
	 
input clk;
input rst_n;
input direction;//direction=0:¥ª  direction=1:¥k
input mode1;//1010¥ªor¥k²¾
input mode2;//¤£Â_input¶i0 ¤£Â_¥ªor¥k²¾
input mode3;//¤£Â_input¶i1 ¤£Â_¥ªor¥k²¾
output [3:0] ftsd_ctl;
output [14:0] display;
	 
	 
wire [3:0] bcd;
wire [1:0] clk_ctl;
wire [3:0] in0, in1, in2, in3;
wire clk_out;



reg [3:0] c0,c1,c2,c3;




always@(posedge clk_out or negedge rst_n)
begin
	if(~rst_n)
	begin
	 c0<=4'd1;
	 c1<=4'd0;
	 c2<=4'd1;
	 c3<=4'd0;
	end
	else if(mode1==1)
	begin
		if(direction==0)
		begin
			c0<=c1;
			c1<=c2;
			c2<=c3;
			c3<=c0;
		end
		else
		begin
			c0<=c3;
			c1<=c0;
			c2<=c1;
			c3<=c2;
		end
	end
	else if(mode2==1)
	begin
		if(direction==0)
		begin
			c0<=c1;
			c1<=c2;
			c2<=c3;
			c3<=4'd0;
		end
		else
		begin
			c0<=4'd0;
			c1<=c0;
			c2<=c1;
			c3<=c2;
		end
	end
	else
	begin
		if(direction==0)
		begin
			c0<=c1;
			c1<=c2;
			c2<=c3;
			c3<=4'd1;
		end
		else
		begin
			c0<=4'd1;
			c1<=c0;
			c2<=c1;
			c3<=c2;
		end
	end
end






assign in0=c0;
assign in1=c1;
assign in2=c2;
assign in3=c3;




freq_div f1(
	.clk_out(clk_out),
	.clk_ctl(clk_ctl), // divided clock output
	.clk(clk), // global clock input
	.rst_n(rst_n) // active low reset
	);

bcd2ftsegdec b1( 
	.display(display), // 14-segment display output
	.bcd(bcd) // BCD input
	);

scan_ctl s1(
	.ftsd_ctl(ftsd_ctl), // ftsd display control signal 
	.ftsd_in(bcd), // output to ftsd display
	.in0(in0), // 1st input
	.in1(in1), // 2nd input
	.in2(in2), // 3rd input
	.in3(in3), // 4th input
	.ftsd_ctl_en(clk_ctl) // divided clock for scan control
	);
	
	
endmodule
