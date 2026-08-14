module Demux_1x4_behavioural(Y,sel,din);
  output reg [3:0] Y;
  input din;
  input [1:0] sel;

  always @(*)
    begin
      case (sel)
        2'b00 : begin Y = {1'b0,1'b0,1'b0,din}; end
        2'b01 : begin Y = {1'b0,1'b0,din,1'b0}; end
        2'b10 : begin Y = {1'b0,din,1'b0,1'b0}; end
        2'b11 : begin Y = {din,1'b0,1'b0,1'b0}; end
      end
endmodule
