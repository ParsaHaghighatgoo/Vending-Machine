`timescale 1ns / 1ps

//main module source:
module readstuff(
	input clock,
	output reg [10:0] data [0:7]
);

	//file for opening & save for saving data
	integer file ;
	integer save ;
	
	
	always @(posedge clock)begin
		// opening:
		file = $fopen("C:\Users\prca\Desktop\vending machine\stuff.txt", "r");
		//saving:
		save = $fscanf(file, "%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\%b\n",data[0], data[1], data[2], data[3],data[4], data[5], data[6], data[7]);
      //closig:
		$fclose(file);
   end 


endmodule
