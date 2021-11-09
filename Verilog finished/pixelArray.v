//Pixel array file

module PIXEL_ARRAY
  (
   input logic CLK,
   input logic VBN1, //anaBias
   input logic RAMP, //anaRamp
   input logic RESET, //anaReset
   input logic ERASE, //5
   input logic EXPOSE, //255
   input logic CONVERT, //255
   input logic READ1, //5
   input logic READ2, //5
   input logic READ3, //5
   input logic READ4, //5
   inout [7:0] DATA
   );
   
//------- SOME PARAMETERS TO EXPOSE DIFFERENTLY ------
   
   parameter real dvpix1 = 0;
   parameter real dvpix2 = 0.3;
   parameter real dvpix3 = 0.7;
   parameter real dvpix4 = 1;

//----------------------------------------------------
   
   PIXEL_SENSOR #(.dv_pixel(dvpix1)) PX1
     (.VBN1(VBN1), 
      .RAMP(RAMP), 
      .RESET(RESET), 
      .ERASE(ERASE), 
      .EXPOSE(EXPOSE), 
      .READ(READ1), 
      .DATA(DATA)
      );
   PIXEL_SENSOR #(.dv_pixel(dvpix2)) PX2
     (.VBN1(VBN1), 
      .RAMP(RAMP), 
      .RESET(RESET), 
      .ERASE(ERASE), 
      .EXPOSE(EXPOSE), 
      .READ(READ2), 
      .DATA(DATA)
      );
   PIXEL_SENSOR #(.dv_pixel(dvpix3)) PX3
     (.VBN1(VBN1), 
      .RAMP(RAMP), 
      .RESET(RESET), 
      .ERASE(ERASE), 
      .EXPOSE(EXPOSE), 
      .READ(READ3), 
      .DATA(DATA)
      );
   PIXEL_SENSOR #(.dv_pixel(dvpix4)) PX4
     (.VBN1(VBN1), 
      .RAMP(RAMP), 
      .RESET(RESET), 
      .ERASE(ERASE), 
      .EXPOSE(EXPOSE), 
      .READ(READ4), 
      .DATA(DATA)
      );
   

endmodule //PIXEL_ARRAY


