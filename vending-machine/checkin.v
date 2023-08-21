`timescale 1ns / 1ps

//this module check the task went wrong or not:
module checkin(
	input check[1:0],
	output redlight,
	output reg [3:0]result,
	output reg [6:0]sevensegment
	);

	always * begin
	if(check == 2'b00)begin
		assign result = 4'b1111;
	end
	else begin
		assign result = 4'b0000;
		redlight <=1 ;
		end
	end	
	
	//and print it with sevenseg
	//ok:1111
	//wrong:0000
	sevensegment ss(
	.clock(1),
	.printnumber(result),
	.sevensegment(sevensegment)
	);
	
	

endmodule
