// Code your design here
module Demux_1x4_dataflow(Din,s0,s1,y0,y1,y2,y3);
  input Din;
  input s0,s1;
  output y0,y1,y2,y3;

  wire s0_bar,s1_bar;
  assign s0_bar = ~s0;
  assign s1_bar = ~s1;

  assign y0 = Din & s1_bar & s0_bar;
  assign y1 = Din & s1_bar & s0;
  assign y2 = Din & s1 & s0_bar;
  assign y3 = Din & s1 & s0;
endmodule
