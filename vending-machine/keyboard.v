`timescale 1ns / 1ps

module keyboard(
	input clock,
	input [12:0]in,
	output reg [1:0]usermode,
	output reg [2:0]stuffmode,
	output reg [3:0]sizein,
	output reg [3:0]addsize,
	output reg [3:0]cmoney,
	output reg [3:0]withdrawmoney,
	output reg [6:0]sevensegment
	);

	always @(posedge clock)begin
	//usermode:
	usermode <= in[12:11];
	//display usermode with sevensegment:
	sevensegmentdisplay display(
		.clock(clock),
		.printnumber(usermode),
		.sevensegment(sevensegment),	
			);
	
	//stuffmode:
	stuffmode <= in[10:8];
	//display stuffmode with sevensegment:
	sevensegmentdisplay display(
		.clock(clock),
		.printnumber(stuffmode),
		.sevensegment(sevensegment),	
			);
	
	//sizein or addsize:
	sizein <= in[7:4];
	addsize <= in[7:4];
	//display addsize or sizein with sevensegment:
	sevensegmentdisplay display(
		.clock(clock),
		.printnumber(sizein),
		.sevensegment(sevensegment),	
			);
	
	
	//cmoney or withdrawmoney:
	cmoney <= in[3:0];
	withdrawmoney <= in[3:0];
	//display cmoney or withdrawomoney with sevensegment:
	sevensegmentdisplay display(
		.clock(clock),
		.printnumber(cmoney),
		.sevensegment(sevensegment),	
			);
	end
		
endmodule
