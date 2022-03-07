/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input usb_rx,
    output reg usb_tx,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [(3'h5+0)-1:0] M_buttoncond_out;
  reg [(3'h5+0)-1:0] M_buttoncond_in;
  
  genvar GEN_buttoncond0;
  generate
  for (GEN_buttoncond0=0;GEN_buttoncond0<3'h5;GEN_buttoncond0=GEN_buttoncond0+1) begin: buttoncond_gen_0
    button_conditioner_2 buttoncond (
      .clk(clk),
      .in(M_buttoncond_in[GEN_buttoncond0*(1)+(1)-1-:(1)]),
      .out(M_buttoncond_out[GEN_buttoncond0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  wire [7-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [16-1:0] M_seg_values;
  multi_seven_seg_3 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  wire [16-1:0] M_addertest_out;
  wire [1-1:0] M_addertest_z;
  wire [1-1:0] M_addertest_v;
  wire [1-1:0] M_addertest_n;
  wire [8-1:0] M_addertest_checkoff;
  wire [8-1:0] M_addertest_flag;
  wire [16-1:0] M_addertest_s;
  reg [1-1:0] M_addertest_button;
  reg [1-1:0] M_addertest_endbutton;
  addertest_4 addertest (
    .clk(clk),
    .rst(rst),
    .button(M_addertest_button),
    .endbutton(M_addertest_endbutton),
    .out(M_addertest_out),
    .z(M_addertest_z),
    .v(M_addertest_v),
    .n(M_addertest_n),
    .checkoff(M_addertest_checkoff),
    .flag(M_addertest_flag),
    .s(M_addertest_s)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    led = 8'h00;
    io_led = 24'h000000;
    io_led[16+0+4-:5] = io_button;
    M_buttoncond_in = io_button;
    M_addertest_button = M_buttoncond_out[1+0-:1];
    M_addertest_endbutton = M_buttoncond_out[3+0-:1];
    io_led[0+0+7-:8] = M_addertest_checkoff;
    io_led[8+0+7-:8] = M_addertest_flag;
    M_seg_values = {M_addertest_s[12+3-:4], M_addertest_s[8+3-:4], M_addertest_s[4+3-:4], M_addertest_s[0+3-:4]};
    io_seg = ~M_seg_seg;
    io_sel = ~M_seg_sel;
  end
endmodule