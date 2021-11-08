module COUNTER
  (
   input logic CLK, RESET,
   output [7:0] DATA
);
   
 	
   always @(posedge CLK or posedge RESET) begin
      if(RESET)
	DATA  <= 0;
      else begin
	 DATA <= DATA + 1;
      end
   end
endmodule
   
