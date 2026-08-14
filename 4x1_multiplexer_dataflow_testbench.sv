module Mux_test;
  reg [1:0] i0,i1,i2,i3;
  reg [1:0] sel;
  wire [1:0] out;

  // Instantiate design under test
  Mux_4x1_dataflow inst_mux (.i0(i0), .i1(i1), .i2(i2) , .i3(i3),
.sel(sel),.out(out));

  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    $monitor($time,"  Select = %d, Output = %d",sel,out);
    i0 <= 2'd0;
    i1 <= 2'd1;
    i2 <= 2'd2;
    i3 <= 2'd3;
    sel <= 2'b00;

    #10 sel <= 2'b10;
    #10 sel <= 2'b11;
    #10 $finish;
  end
endmodule
