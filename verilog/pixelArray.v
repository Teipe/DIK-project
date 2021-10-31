//Pixel array file
//Making a MUX that takes in values from the pixelSensor and selects individually each pixel as output

module MUX_4to1
  (
   input logic [7:0] a_in,b_in,c_in,d_in,
   input logic [1:0] sel,
   output logic [7:0] m_out
   
   );

   always_comb begin
      case (sel)
	2'b00 : m_out = a_in;
	2'b01 : m_out = b_in;
	2'b10 : m_out = c_in;
	2'b11 : m_out = d_in;
	default : m_out = 8'bx;
      endcase
   end
   
endmodule // MUX_4to1

module CNTR_4
  (
   
   );
   
