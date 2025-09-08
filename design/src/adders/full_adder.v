module full_adder (
    output out,
    output cout,
    input  x,
    input  y,
    input  cin
);
  wire med1, med2, med3;
  and (med1, x, y);
  xor (med2, x, y);
  and (med3, med2, cin);
  or (cout, med1, med3);
  xor (out, med2, cin);
endmodule
