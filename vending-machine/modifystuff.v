`timescale 1ns / 1ps

module modifystuff(
    input clock,
	 output reg [10:0] data [0:7]
	 );
	
	integer file;
	integer save;

	always @(posedge clock) begin
		//open:
		file = $fopen("C:\Users\prca\Desktop\vending machine\stuff.txt", "r\w");
		
		//writing new detail:
		save = $fwrite(file, "%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\%b\n",data[0], data[1], data[2], data[3],data[4], data[5], data[6], data[7]);
		
		$fclose(file);
	end


endmodule
