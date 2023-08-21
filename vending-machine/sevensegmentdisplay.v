`timescale 1ns / 1ps

//main module of sevensegment input && output:
module sevensegmentdisplay(
	input clock,
	input [3:0]printnumber,
	output reg[6:0]sevensegment
    );

//printing the number with finding which number svnseg should print:
always @(posedge clock) begin
	case (printnumber)
	 4'b0000: sevensegment = 7'b0111111; // display 0
    4'b0001: sevensegment = 7'b0000110; // display 1
    4'b0010: sevensegment = 7'b1011011; // display 2
    4'b0011: sevensegment = 7'b1001111; // display 3
    4'b0100: sevensegment = 7'b1100110; // display 4
    4'b0101: sevensegment = 7'b1101101; // display 5
    4'b0110: sevensegment = 7'b1111101; // display 6
    4'b0111: sevensegment = 7'b0000111; // display 7
    4'b1000: sevensegment = 7'b1111111; // display 8
    4'b1001: sevensegment = 7'b1100111; // display 9
    4'b1010: sevensegment = 7'b1110111; // display A
    4'b1011: sevensegment = 7'b1111100; // display B
    4'b1100: sevensegment = 7'b0111001; // display C
    4'b1101: sevensegment = 7'b1011110; // display D
    4'b1110: sevensegment = 7'b1111001; // display E
    4'b1111: sevensegment = 7'b1110001; // display F
    default: sevensegment = 7'b0000000; // display nothing
	endcase
end
endmodule
