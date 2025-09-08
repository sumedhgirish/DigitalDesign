module and2 (
    output wire out,
    input x,
    input y
);
  assign out = x & y;
endmodule


module or2 (
    output wire out,
    input x,
    input y
);
  assign out = x | y;
endmodule

module inv (
    output wire out,
    input x
);
  assign out = !x;
endmodule

module gates (
    input x,
    input y,
    input z,
    output wire out
);
  assign out = (x & y) | z;
endmodule
