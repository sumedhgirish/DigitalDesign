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
