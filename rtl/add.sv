module add(a,b,out);
	parameter size = 8;
	input[size-1:0] a,b;
	output[size-1:0] out;
	
	 assign out = a|b;
	endmodule
	




	