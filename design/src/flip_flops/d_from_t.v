module d_from_t (
    input  data,
    input  clk,
    input  rst,
    output out
);
  wire med0;
  xor (med0, out, data);
  t_flip_flop U0 (
      .clk(clk),
      .rst(rst),
      .t  (med0),
      .q  (out)
  );
endmodule
