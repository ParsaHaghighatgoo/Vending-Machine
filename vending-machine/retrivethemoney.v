`timescale 1ns / 1ps

//main module for retrive the money from the machine:
module retrivethemoney(
	input clock,
	input [3:0]withdrawmoney
	inout [3:0]pmoney,
	output reg sevensegment,
	output reg redlight
    );
	 
	reg [1:0]check;
	reg [3:0]ressult;
	
	//how much money left in the  machine :
	assign pmoney = pmoney - withdrawmoney;
	
	//printing the amount of money in the machine :
	always @(posedge clock)begin
		if (pmoney != 4'b0000 && withdrawmoney <= pmoney)begin
			sevensegment <= pmoney;
			redlight = 0 ;
			end
		
		//if an error was occurd sevensegment show 0 in 7 bit binnary mode :
		else begin	
			sevensegment <= 7'b0000000;
			redlight = 1 ;
			end
		end	
	
	
	//checking the task:
	if(redlight!=1)begin
	check <= 2'b00
	end
	else begin
	check <= 2'b01
	end	
	checkin check(
	.check(check),
	.redlight(redlight),
	.result(result),
	.sevensegment(sevensegment)
	);

endmodule
