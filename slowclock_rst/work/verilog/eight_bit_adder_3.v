/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module eight_bit_adder_3 (
    input [7:0] x,
    input [7:0] y,
    input cin,
    output reg [7:0] s,
    output reg cout
  );
  
  
  
  wire [(4'h8+0)-1:0] M_fulladder_s;
  wire [(4'h8+0)-1:0] M_fulladder_cout;
  reg [(4'h8+0)-1:0] M_fulladder_x;
  reg [(4'h8+0)-1:0] M_fulladder_y;
  reg [(4'h8+0)-1:0] M_fulladder_cin;
  
  genvar GEN_fulladder0;
  generate
  for (GEN_fulladder0=0;GEN_fulladder0<4'h8;GEN_fulladder0=GEN_fulladder0+1) begin: fulladder_gen_0
    full_adder_6 fulladder (
      .x(M_fulladder_x[GEN_fulladder0*(1)+(1)-1-:(1)]),
      .y(M_fulladder_y[GEN_fulladder0*(1)+(1)-1-:(1)]),
      .cin(M_fulladder_cin[GEN_fulladder0*(1)+(1)-1-:(1)]),
      .s(M_fulladder_s[GEN_fulladder0*(1)+(1)-1-:(1)]),
      .cout(M_fulladder_cout[GEN_fulladder0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  
  always @* begin
    M_fulladder_x = x;
    M_fulladder_y = y;
    M_fulladder_cin[0+0-:1] = cin;
    M_fulladder_cin[1+6-:7] = M_fulladder_cout[0+6-:7];
    s = M_fulladder_s;
    cout = M_fulladder_cout[7+0-:1];
  end
endmodule
