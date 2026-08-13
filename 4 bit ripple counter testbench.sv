`timescale 1ns/1ps
`default_nettype none

module tb_ripple_carry_counter;

    localparam time CLK_HALF_PERIOD = 5ns;

    logic       clk;
    logic       reset;
    logic [3:0] q;

    ripple_carry_counter #(
        .WIDTH(4)
    ) dut (
        .q     (q),
        .clk   (clk),
        .reset (reset)
    );

    // Clock
    initial begin
        clk = 1'b0;

        forever begin
            #CLK_HALF_PERIOD;
            clk = ~clk;
        end
    end

    // Stimulus
    initial begin
        reset = 1'b1;

        #10ns;
        reset = 1'b0;

        #200ns;
        reset = 1'b1;

        #10ns;
        reset = 1'b0;

        #50ns;
        $finish;
    end

    // Waveform
    initial begin
        $dumpfile("ripple_counter.vcd");
        $dumpvars(0, tb_ripple_carry_counter);
    end

    // Reset check
    always @(posedge reset) begin
        #1ps;

        assert (q == 4'b0000)
            else $error(
                "Reset failure: q = %b, expected 0000",
                q
            );
    end

endmodule

`default_nettype wire
