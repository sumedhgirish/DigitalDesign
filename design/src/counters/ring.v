module ring (
    input rst,
    input clk,
    output [2:0] q
);

  dff #(
      .INIT(1'b1)
  ) U0 (
      .rst(rst),
      .clk(clk),
      .d  (q[2]),
      .q  (q[0])
  );

  dff #(
      .INIT(1'b0)
  ) U1 (
      .rst(rst),
      .clk(clk),
      .d  (q[0]),
      .q  (q[1])
  );

  dff #(
      .INIT(1'b0)
  ) U2 (
      .rst(rst),
      .clk(clk),
      .d  (q[1]),
      .q  (q[2])
  );

endmodule
