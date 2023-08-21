`timescale 1ns / 1ps

//main module and handling the code all together in one module:
module main(
	input canclebutton,
	input supportbutton,
	input ownerpass[5:0],
	input typing[12:0],
	input clock,
	inout statisfy,
	input tmps,
	inout [1:0]usermode,
	inout [2:0]stuffmode,
	inout [3:0]sizein,
	inout [3:0]cmoney,
	inout [3:0]pmoney,
	inout [3:0]addsize,
	inout [3:0]withdrawmoney,
	input [3:0]printnumber,
	output wire redlight[0:3],
	output wire [6:0]sevensegment,
	output wire [10:0]product
    );

//reset button :
if (canclebutton != 1) begin

//this is a keyboard for user to enter the detail which user should give to machine:
//usermode at first
//stuffmode 2th
//sizein or addsize 3th
//cmoney or withdrawmoney 4th
//other details dont relate to user and it saved on the machine storage(enter with tb):
//u can write this detail and handle it with tb too or add other object to keyboard easily:
	keyboard keyboard(
		.clock(clock),
		.in(typing),
		.addsize(addsize),
		.sizein(sizein),
		.cmoney(cmoney),
		.withdrawmoney(withdrawmoney)
	); 	
	
	

	//user mode :
	always @(posedge clock) begin
	case (usermode)
		
		//if user's input is 0 go to buyingmodule :
		2'b00:
			BuyingPhase buy(
			.clock(clock),
			.mode(stuffmode),
			.cmoney(cmoney),
			.csize(sizein),
			.pmoney(pmoney),
			.product(product),
			.redlight(redlight[0])
			);
			
			satisfy <= satisfy + tmps;
			if(supportbutton == 1)begin
				supportbutton s();
			end
		;	
		
		//if user's input is 1 go to charging the supply module :
		2'b01:
			if(ownerpass == 6'b001101)begin
			chargingthesupply charge(
			.mode(stuffmode),
			.addsize(addsize),
			.clock(clock),
			.redlight(redlight[1]),
			.product(product)
			);
			end
			else begin redlight[1] = 1 ; end
		;
		
		//if user's input is 2 go to retrive money module :
		2'b10:
			if(ownerpass == 6'b001101)begin
			retrivethemoney retrive(
			.clock(clock),
			.withdrawmoney(withdrawmoney),
			.pmoney(pmoney),
			.sevensegment(sevensegment),
			.redlight(redlight[2])
			);
			end
			else begin redlight[2] = 1 ; end
		;
		
		//if user's input is 3 go to sevensegment display module :
		2'b11:
			sevensegmentdisplay display(
			.clock(clock),
			.printnumber(printnumber),
			.sevensegment(sevensegment)
			);
		;
		
		// if user mode was wrong :
		default : assign redlight[3] = 1 ;
	endcase
	
	
	
end else begin
	end
end
	
endmodule
