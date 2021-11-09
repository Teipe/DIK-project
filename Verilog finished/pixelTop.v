//Tiny letters is wires and parameters
//Large letters are input or output gates (Just to have a clean script)

module PIXELTOP
  (
   input logic CLK,
   input logic RESET,
   inout [7:0] DATA
   );

   //--- WIRES ---
   wire 	convert;
   wire 	erase;
   wire 	expose;
   wire 	read1;
   wire 	read2;
   wire 	read3;
   wire 	read4;

   //---ANALOG---
   logic 	anaBias;
   logic 	anaRamp;
   logic 	anaReset;
   
   
   pixelSensorFsm FSM
     (
      .clk(CLK),
      .reset(RESET),
      .erase(erase), //outputs into PIX_ARR down here
      .expose(expose),
      .read1(read1),
      .read2(read2),
      .read3(read3),
      .read4(read4),
      .convert(convert),
      .DATA(DATA)
      );
   

   PIXEL_ARRAY PIX_ARR
     (
      .CLK(CLK),
      .VBN1(anaBias), // =CLK at expose
      .RAMP(anaRamp), // =CLK at convert
      .RESET(anaReset),
      .ERASE(erase), //5
      .EXPOSE(expose), //255
      .CONVERT(convert), //255
      .READ1(read1), //5
      .READ2(read2), //5
      .READ3(read3), //5
      .READ4(read4), //5
      .DATA(DATA) //inout 8-bit
      );
   
   // --- CHEATING WITH THE ANALOG VALUES ---
   assign anaBias = expose ? CLK : 0;
   assign anaRamp = convert ? CLK : 0;
   assign anaReset = 1; //just to set a value for pixsensor Reset input. 

endmodule //PIXELTOP
