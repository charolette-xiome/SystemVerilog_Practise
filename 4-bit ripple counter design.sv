`default_nettype none

module tff (
    output logic q,
    input  logic  clk,
    input  logic  reset
);

  always_ff @(negedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else
            q <= ~q;
    end

endmodule


module ripple_carry_counter #(
    parameter int WIDTH = 4
) (
    output logic [WIDTH-1:0] q,
    input  logic             clk,
    input  logic             reset
);

    tff tff0 (
        .q     (q[0]),
        .clk   (clk),
        .reset (reset)
    );

    tff tff1 (
        .q     (q[1]),
        .clk   (q[0]),
        .reset (reset)
    );

    tff tff2 (
        .q     (q[2]),
        .clk   (q[1]),
        .reset (reset)
    );

    tff tff3 (
        .q     (q[3]),
        .clk   (q[2]),
        .reset (reset)
    );

endmodule

`default_nettype wire
