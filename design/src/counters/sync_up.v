module sync_up (
    input clk,
    input rst,
    output [1:0] q
);
  jkff U1 (
      .clk(clk),
      .rst(rst),
      .j  (q[0]),
      .k  (q[0]),
      .q  (q[1])
  );

  jkff U0 (
      .clk(clk),
      .rst(rst),
      .j  (1'b1),
      .k  (1'b1),
      .q  (q[0])
  );
endmodule
