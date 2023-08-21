`timescale 1ns / 1ps

module tb;

	// Inputs
	reg canclebutton;
	reg supportbutton;
	reg ownerpass;

	main uut (
		.canclebutton(canclebutton), 
		.supportbutton(supportbutton), 
		.ownerpass(ownerpass)
	);

	initial begin
		canclebutton = 0;
		supportbutton = 1;
		ownerpass = 001101;

		#100;
        

	end
      
endmodule

