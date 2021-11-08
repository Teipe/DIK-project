//Pixel array file
//Making a MUX that takes in values from the pixelSensor and selects individually each pixel as output

module MUX4TO1
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

module DEC2TO4
  (
   input logic [1:0] sel_in,
   output logic [3:0] a_out
   );
   always@(sel_in) begin
     case (sel_in)
       2'b00 : a_out = 4'b0001;
       2'b01 : a_out = 4'b0010;
       2'b10 : a_out = 4'b0100;
       2'b11 : a_out = 4'b1000;
       default : a_out = 4'b0000;
     endcase
   end
endmodule // DECODER

module DATA_BUS
  (
   input logic [7:0] data_bus,
   input 
   );
endmodule //BUS

module PIXEL_ARRAY
  (
   input logic erase, expose, read, convert,
   output logic [7:0] DATA
   );
   
   logic [7:0] d1,d2,d3,d4;
   logic [3:0] px_out;
   logic [1:0] px_sel; //select signal to choose what pixel gets to go on the bus.
   logic       vbn, ramp, reset;
   
   
   DEC2TO4 dec(px_sel, px_out);
   PIXEL_SENSOR pix1(vbn, ramp, reset, erase, expose, read, d1); //all inputs, but data is also output
   PIXEL_SENSOR pix2(vbn, ramp, reset, erase, expose, read, d2); //all inputs, but data is also output
   PIXEL_SENSOR pix3(vbn, ramp, reset, erase, expose, read, d3); //all inputs, but data is also output
   PIXEL_SENSOR pix4(vbn, ramp, reset, erase, expose, read, d4); //all inputs, but data is also output
   

endmodule //PIXEL_ARRAY
   
