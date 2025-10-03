module async_up (
    input clk,
    input rst,
    output [1:0] q
);

  dff U0 (
      .rst(rst),
      .clk(clk),
      .d  (~q[0]),
      .q  (q[0])
  );

  dff U1 (
      .rst(rst),
      .clk(~q[0]),
      .d  (~q[1]),
      .q  (q[1])
  );
endmodule
