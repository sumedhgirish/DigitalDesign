`timescale 1ns / 1ps
module tb_updown_counter_2bit;
  reg clk = 0;
  reg rst = 1;
  reg up_down = 1;
  wire [1:0] q;

  // DUT (your module from before)
  sync_updown dut (
      .clk(clk),
      .rst(rst),
      .M  (up_down),
      .q  (q)
  );

  // 10 ns period clock
  always #5 clk = ~clk;

  // Print ONLY at posedge so we see state after each synchronous update
  always @(posedge clk) begin
    $display("%0t  clk=%0b rst=%0b upDn=%0b  Q=%0b%0b", $time, clk, rst, up_down, q[1], q[0]);
  end

  initial begin
    $dumpfile("updown_2bit_jk.vcd");
    $dumpvars(0, tb_updown_counter_2bit);

    // Keep reset high for one edge -> Q becomes 00 at first posedge
    @(negedge clk);
    rst = 1;
    @(negedge clk);
    rst = 0;     // release reset just before a posedge

    // Count UP to reach 11: (00)->01->10->11  (3 transitions)
    // Change 'up_down' only on negedge so the next posedge samples it cleanly
    up_down = 1;
    repeat (3) @(negedge clk);  // settle to 11

    // Now switch to DOWN **before** the next posedge so next state is 10
    up_down = 0;
    repeat (3) @(negedge clk);  // 11->10->01->00

    $finish;
  end
endmodule
