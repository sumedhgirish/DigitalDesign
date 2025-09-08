module hellotb ();
  reg inp1, inp2;
  wire out;

  and2 and2 (
      .o(out),
      .x(inp1),
      .y(inp2)
  );

  initial begin
    inp1 = 0;
    inp2 = 0;
    #2 inp1 = 1;
    #1 inp2 = 1;
  end

  initial begin
    #2 $display("The output of and2 %b %b: %b", inp1, inp2, out);
    #2 $display("The output of and2 %b %b: %b", inp1, inp2, out);
  end
endmodule
