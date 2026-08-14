// Code your testbench here
// or browse Examples

module Mux_test;
  reg Din;
  reg s0,s1;
  wire y0,y1,y2,y3;
  wire [1:0]sel;
  // Instantiate design under test
  Demux_1x4_dataflow inst_demux
(.Din(Din),.s0(s0),.s1(s1),.y0(y0),.y1(y1),.y2(y2),.y3(y3));
  assign sel={s1,s0};

  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    Din = 1'b1;
    $monitor($time,"  Select = %d, y0 = %b y1 = %b y2 =%b y3=%b",sel,y0,y1,y2,y3);

    {s1,s0} <= 2'b00;

    #10 {s1,s0} <= 2'b10;
    #10 {s1,s0} <= 2'b11;
    #10 {s1,s0} <= 2'b01;
    #10 $finish;
  end
endmodule
