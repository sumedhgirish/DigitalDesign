==> half_adder.v <==

module half_adder (
    output out,
    output cout,
    input  x,
    input  y
);
  xor (out, x, y);
  and (cout, x, y);
endmodule

==> full_adder.v <==
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

==> ripple_carry_adder.v <==
module ripple_carry_adder (
    output [3:0] out,
    output cout,
    input [3:0] in1,
    input [3:0] in2
);
  wire c0, c1, c2;
  full_adder U0 (
      .out(out[0]),
      .x(in1[0]),
      .y(in2[0]),
      .cout(c0),
      .cin(1'b0)
  );
  full_adder U1 (
      .out(out[1]),
      .x(in1[1]),
      .y(in2[1]),
      .cout(c1),
      .cin(c0)
  );
  full_adder U2 (
      .out(out[2]),
      .x(in1[2]),
      .y(in2[2]),
      .cout(c2),
      .cin(c1)
  );
  full_adder U3 (
      .out(out[3]),
      .x(in1[3]),
      .y(in2[3]),
      .cout(cout),
      .cin(c2)
  );
endmodule

==> bcd_adder.v <==
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

==> adders_tb.v <==
module adders_tb ();
  reg half_in1, half_in2;
  reg full_in1, full_in2, full_cin;
  reg [3:0] ripple_in1;
  reg [3:0] ripple_in2;
  reg [3:0] bcd_in1;
  reg [3:0] bcd_in2;

  wire half_out;
  wire half_cout;
  wire full_out;
  wire full_cout;
  wire [3:0] ripple_out;
  wire ripple_cout;
  wire [3:0] bcd_out;
  wire bcd_cout;

  initial begin
    $display("Half Adder:");
    $monitor("%b %b %b %b", half_in1, half_in2, half_out, half_cout);

    #10{half_in1, half_in2} = 2'b00;
    #10{half_in1, half_in2} = 2'b01;
    #10{half_in1, half_in2} = 2'b10;
    #10{half_in1, half_in2} = 2'b11;

    $display("Full Adder:");
    $monitor("%b %b %b %b %b", full_in1, full_in2, full_cin, full_out, full_cout);

    #10{full_in1, full_in2, full_cin} = 3'b000;
    #10{full_in1, full_in2, full_cin} = 3'b001;
    #10{full_in1, full_in2, full_cin} = 3'b010;
    #10{full_in1, full_in2, full_cin} = 3'b011;
    #10{full_in1, full_in2, full_cin} = 3'b100;
    #10{full_in1, full_in2, full_cin} = 3'b101;
    #10{full_in1, full_in2, full_cin} = 3'b110;
    #10{full_in1, full_in2, full_cin} = 3'b111;

    $display("Ripple Adder:");
    $monitor("%4b %4b %4b %b", ripple_in1, ripple_in2, ripple_out, ripple_cout);

    #10{ripple_in1, ripple_in2} = 8'b10000000;
    #10{ripple_in1, ripple_in2} = 8'b01000001;
    #10{ripple_in1, ripple_in2} = 8'b00100010;
    #10{ripple_in1, ripple_in2} = 8'b00010011;
    #10{ripple_in1, ripple_in2} = 8'b00100100;
    #10{ripple_in1, ripple_in2} = 8'b01000101;
    #10{ripple_in1, ripple_in2} = 8'b10000110;
    #10{ripple_in1, ripple_in2} = 8'b01000111;
    #10{ripple_in1, ripple_in2} = 8'b00101000;
    #10{ripple_in1, ripple_in2} = 8'b00011001;
    #10{ripple_in1, ripple_in2} = 8'b00101010;
    #10{ripple_in1, ripple_in2} = 8'b01001011;
    #10{ripple_in1, ripple_in2} = 8'b10001100;
    #10{ripple_in1, ripple_in2} = 8'b01001101;
    #10{ripple_in1, ripple_in2} = 8'b00101110;
    #10{ripple_in1, ripple_in2} = 8'b00011111;

    $display("BCD Adder:");
    $monitor("%4b %4b %4b %b", bcd_in1, bcd_in2, bcd_out, bcd_cout);
    #10{bcd_in1, bcd_in2} = 8'b01100110;
    #10{bcd_in1, bcd_in2} = 8'b00010010;
    #10{bcd_in1, bcd_in2} = 8'b01101001;
    #10{bcd_in1, bcd_in2} = 8'b01000010;
    #10{bcd_in1, bcd_in2} = 8'b01000100;
    #10{bcd_in1, bcd_in2} = 8'b01110110;
    #10{bcd_in1, bcd_in2} = 8'b01111000;
    #10 $finish();

  end


  half_adder U0 (
      .out(half_out),
      .cout(half_cout),
      .x(half_in1),
      .y(half_in2)
  );
  full_adder U1 (
      .out(full_out),
      .cout(full_cout),
      .x(full_in1),
      .y(full_in2),
      .cin(full_cin)
  );
  ripple_carry_adder U2 (
      .out (ripple_out),
      .cout(ripple_cout),
      .in1 (ripple_in1),
      .in2 (ripple_in2)
  );
  bcd_adder U3 (
      .out(bcd_out),
      .cout(bcd_cout),
      .x(bcd_in1),
      .y(bcd_in2)
  );

  initial begin
    $dumpfile("adders.vcd");
    $dumpvars(0, adders_tb);
  end
endmodule

==> output.txt <==
Half Adder:
VCD info: dumpfile adders.vcd opened for output.
x x x x
0 0 0 0
0 1 1 0
1 0 1 0
Full Adder:
x x x x x
0 0 0 0 0
0 0 1 1 0
0 1 0 1 0
0 1 1 0 1
1 0 0 1 0
1 0 1 0 1
1 1 0 0 1
Ripple Adder:
xxxx xxxx xxxx x
1000 0000 1000 0
0100 0001 0101 0
0010 0010 0100 0
0001 0011 0100 0
0010 0100 0110 0
0100 0101 1001 0
1000 0110 1110 0
0100 0111 1011 0
0010 1000 1010 0
0001 1001 1010 0
0010 1010 1100 0
0100 1011 1111 0
1000 1100 0100 1
0100 1101 0001 1
0010 1110 0000 1
BCD Adder:
xxxx xxxx xxxx x
0110 0110 0010 1
0001 0010 0011 0
0110 1001 0101 1
0100 0010 0110 0
0100 0100 1000 0
0111 0110 0011 1
0111 1000 0101 1
adders_tb.v:68: $finish called at 360 (1s)
