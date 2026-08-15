// Code your design here
module generic_priority_encoder(A,D,valid);
  parameter N=10;
  input [N-1 : 0]A;
  output reg valid;
  output reg [$clog2(N)-1:0]D;

  integer I;

  always @(A)
    begin
      D=0;
      valid =0;
      for(I=0;I<N; I=I+1)
        if(A[I])
        begin
          D=I;
          valid =1;

        end
    end

endmodule
