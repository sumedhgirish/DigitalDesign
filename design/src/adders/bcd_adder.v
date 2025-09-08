module bcd_adder (
    output [3:0] out,
    output cout,
    input [3:0] x,
    input [3:0] y
);
  wire [3:0] med_out;
  wire med_cout1, med_cout2;

  ripple_carry_adder U0 (
      .out (med_out),
      .in1 (x),
      .in2 (y),
      .cout(med_cout1)
  );

  wire [3:0] offset;
  wire med1;
  or (med1, med_out[1], med_out[2]);
  and (offset[1], med_out[3], med1);
  and (offset[2], med_out[3], med1);
  and (offset[0], 1'b0, 1'b0);
  and (offset[3], 1'b0, 1'b0);

  ripple_carry_adder U1 (
      .out (out),
      .in1 (med_out),
      .in2 (offset),
      .cout(med_cout2)
  );
  or (cout, med_cout1, med_cout2);


endmodule
