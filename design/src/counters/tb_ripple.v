// tb_ripple_up_counter_2bit.v
`timescale 1ns / 1ps
module tb_ripple_up_counter_2bit;
  reg clk = 0, rst = 1;
  wire [1:0] q;

  async_up dut (
      .clk(clk),
      .rst(rst),
      .q  (q)
  );

  // 10 ns clock
  always #5 clk = ~clk;

  // Print one line per *count* (wait a tiny time so ripple completes)
  always @(posedge clk) begin
    #1 $display("%0t  clk=%0b rst=%0b  Q=%b%b", $time, clk, rst, q[1], q[0]);
  end

  initial begin
    $dumpfile("ripple_up_2bit.vcd");
    $dumpvars(0, tb_ripple_up_counter_2bit);

    // Hold reset for two edges, then release
    repeat (2) @(posedge clk);
    rst <= 0;

    repeat (12) @(posedge clk);
    $finish;
  end
endmodule
