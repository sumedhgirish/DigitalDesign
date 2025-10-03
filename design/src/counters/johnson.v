module johnson (
    input rst,
    input clk,
    output [2:0] q
);

  dff U0 (
      .rst(rst),
      .clk(clk),
      .d  (~q[2]),
      .q  (q[0])
  );

  dff U1 (
      .rst(rst),
      .clk(clk),
      .d  (q[0]),
      .q  (q[1])
  );

  dff U2 (
      .rst(rst),
      .clk(clk),
      .d  (q[1]),
      .q  (q[2])
  );

endmodule
