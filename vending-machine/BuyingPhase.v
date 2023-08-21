`timescale 1ns / 1ps

//writing input and output for buying module:
module BuyingPhase(
	inout cmoney[3:0],
	inout csize[3:0],
	input mode[2:0],
	inout pmoney[3:0],
	input clock,	
	output reg redlight,
	output reg [10:0]product
    );
	
	reg [10:0]stuff[0:7];
	reg [1:0]check;
	reg [3:0]ressult;
	reg [6:0]sevensegment;

//reading stuff.txt and saving :
	readstuff rdd(
		.clock(clock),
		.stuff[0](data[0]),
		.stuff[1](data[1]),
		.stuff[2](data[2]),
		.stuff[3](data[3]),
		.stuff[4](data[4]),
		.stuff[5](data[5]),
		.stuff[6](data[6]),
		.stuff[7](data[7]),
	);

//giftphase :
	if(csize >= 4'b0010)begin 
		csize = csize + 4'b0001;

//find which kind of product customer want:
	always @(posedge clock) begin
		case (mode)
			3'b000: product = stuff[0][10:0];
			3'b001: product = stuff[1][10:0];
			3'b010: product = stuff[2][10:0];
			3'b011: product = stuff[3][10:0];
			3'b100: product = stuff[4][10:0];
			3'b101: product = stuff[5][10:0];
			3'b110: product = stuff[6][10:0];
			3'b111: product = stuff[7][10:0];
			// redlight == 1 if mode of stuff isn't available:
			default: redlight = 1; 
		endcase	

	//findout that customer can buy products or cant:
	if(product[7:4] >= csize && pmoney + cmoney <= 1111 && (product[3:0] * csize ) <= cmoney && redight != 1 ) begin
		
		// modify customer money after buying : 
		assign cmoney = cmoney - (product[3:0] * csize);
		
		// modify in machine(previous) money after buying :
		assign pmoney = pmoney + (product[3:0] * csize);
		
		// changing size of product :
		product[7:4] = product[7:4] - csize[3:0];
		
		// there isnt an error:
		redlight = 0;
		
	else begin
		// smth went wrong and make an error:
		assign redlight=1;
		end
	end
	end
		
	//chaning the detial of selected data 
	always @(*) begin
		case (mode)
		3'b000: stuff[0][10:0] <= product;
		3'b001: stuff[1][10:0] <= product;
		3'b010: stuff[2][10:0] <= product;
		3'b011: stuff[3][10:0] <= product;
		3'b100: stuff[4][10:0] <= product;
		3'b101: stuff[5][10:0] <= product;
		3'b110: stuff[6][10:0] <= product;
		3'b111: stuff[7][10:0] <= product;
		endcase
	end						

	//writing new stuff's detail in stuff.txt: 
	modifystuff mdd(
		.clock(clock),
		.stuff[0](data[0]),
		.stuff[1](data[1]),
		.stuff[2](data[2]),
		.stuff[3](data[3]),
		.stuff[4](data[4]),
		.stuff[5](data[5]),
		.stuff[6](data[6]),
		.stuff[7](data[7]),
	);

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
