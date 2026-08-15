// Code your testbench here
// or browse Examples

module Priority_encoder_test;
  parameter N=10;
  reg [N-1:0]A;
  wire valid;
  wire [$clog2(N)-1:0] D;

  // Instantiate design under test
  generic_priority_encoder #(N) inst(A,D,valid);

  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);

    $monitor($time,"Encoded BCD Output = %0b ; Input = %0b ; Valid = %0b",D,A,valid);

    A <= 10'd1;

    #10 A <= 10'b10_0000_0000;
    #10 A <= 10'b10_1000_0000;
    #10 A <= 10'b00_1000_0000;
    #10 A <= 10'b00_0000_0010;
    #10 $finish;
  end
endmodule
