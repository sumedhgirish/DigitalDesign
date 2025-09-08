module arbiter_tb ();
  wire out0, out1;
  reg clk, reset, in0, in1;

  initial begin
    $monitor("req0=%b,req1=%b,gnt0=%b,gnt1=%b", in0, in1, out0, out1);
    clk   = 0;
    reset = 0;
    in0   = 0;
    in1   = 0;
    #5 reset = 1;
    #15 reset = 0;
    #10 in0 = 1;
    #10 in0 = 0;
    #10 in1 = 1;
    #10 in1 = 0;
    #10{in0, in1} = 2'b11;
    #10{in0, in1} = 2'b00;
    #10 $finish;
  end

  always begin
    #5 clk = !clk;
  end

  arbiter U0 (
      .clk  (clk),
      .reset(reset),
      .req_0(in0),
      .req_1(in1),
      .grt_0(out0),
      .grt_1(out1)
  );
endmodule
