
module half_adder (
    output out,
    output cout,
    input  x,
    input  y
);
  xor (out, x, y);
  and (cout, x, y);
endmodule
