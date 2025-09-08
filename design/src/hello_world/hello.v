module hello ();
  initial begin
    $display("Hello, World!");
  end
endmodule

module and2 (
    output o,
    input  x,
    input  y
);
  assign o = x & y;
endmodule


module or2 (
    output o,
    input  x,
    input  y
);
  assign o = x | y;
endmodule


module inv (
    output o,
    input  x
);
  assign o = !x;
endmodule


