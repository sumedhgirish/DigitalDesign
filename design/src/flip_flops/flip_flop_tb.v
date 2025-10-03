module flip_flop_tb ();
  reg inp1, inp2, clk, rst;
  wire t_out, d_out, jk_out, sr_out, dft_out;

  initial begin
    $monitor("Inputs=%b %b :: T=%b D=%b JK=%b SR=%b DfT=%b :: rst=%b", inp1, inp2, t_out, d_out,
             jk_out, sr_out, dft_out, rst);
    {inp1, inp2} = 2'b01;
    rst = 1'b1;
    clk = 1'b0;

    #5 rst = 1'b0;
    #10{inp1, inp2} = 2'b00;
    #10{inp1, inp2} = 2'b01;
    #10{inp1, inp2} = 2'b10;
    #10{inp1, inp2} = 2'b11;
    #20 $finish(0);
  end

  initial begin
    $dumpfile("flip_flops.vcd");
    $dumpvars(0, flip_flop_tb);
  end

  always
    forever begin
      #5 clk = ~clk;
    end

  t_flip_flop U0 (
      .clk(clk),
      .rst(rst),
      .t  (inp1),
      .q  (t_out)
  );

  d_flip_flop U1 (
      .clk(clk),
      .rst(rst),
      .data(inp1),
      .q(d_out)
  );

  jk_flip_flop U2 (
      .clk(clk),
      .j  (inp1),
      .k  (inp2),
      .q  (jk_out)
  );

  sr_flip_flop U3 (
      .clk(clk),
      .set(inp1),
      .rst(inp2),
      .q  (sr_out)
  );

  d_from_t U4 (
      .data(inp1),
      .clk (clk),
      .rst (rst),
      .out (dft_out)
  );
endmodule
