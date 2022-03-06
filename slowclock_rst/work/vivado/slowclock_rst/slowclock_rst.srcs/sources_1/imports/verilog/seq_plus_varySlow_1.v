/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module seq_plus_varySlow_1 (
    input clk,
    input rst,
    output reg [7:0] out
  );
  
  
  
  localparam SLOWCLOCK_SIZE = 5'h1b;
  
  reg [7:0] M_register_1_d, M_register_1_q = 1'h0;
  
  
  localparam S0_y_controller = 2'd0;
  localparam S1_y_controller = 2'd1;
  localparam S2_y_controller = 2'd2;
  
  reg [1:0] M_y_controller_d, M_y_controller_q = S0_y_controller;
  
  wire [8-1:0] M_adder_s;
  wire [1-1:0] M_adder_cout;
  reg [8-1:0] M_adder_x;
  reg [8-1:0] M_adder_y;
  reg [1-1:0] M_adder_cin;
  eight_bit_adder_3 adder (
    .x(M_adder_x),
    .y(M_adder_y),
    .cin(M_adder_cin),
    .s(M_adder_s),
    .cout(M_adder_cout)
  );
  
  wire [27-1:0] M_slowClock_value;
  counter_4 slowClock (
    .clk(clk),
    .rst(rst),
    .value(M_slowClock_value)
  );
  
  wire [1-1:0] M_slowClockEdge_out;
  reg [1-1:0] M_slowClockEdge_in;
  edge_detector_5 slowClockEdge (
    .clk(clk),
    .in(M_slowClockEdge_in),
    .out(M_slowClockEdge_out)
  );
  
  always @* begin
    M_y_controller_d = M_y_controller_q;
    M_register_1_d = M_register_1_q;
    
    M_adder_y = 8'h00;
    M_adder_x = M_register_1_q;
    M_adder_cin = 1'h0;
    M_slowClockEdge_in = M_slowClock_value[26+0-:1];
    
    case (M_y_controller_q)
      S0_y_controller: begin
        M_adder_y = 8'h02;
        if (M_slowClockEdge_out == 1'h1) begin
          M_y_controller_d = S1_y_controller;
        end
      end
      S1_y_controller: begin
        M_adder_y = 8'h07;
        if (M_slowClockEdge_out == 1'h1) begin
          M_y_controller_d = S2_y_controller;
        end
      end
      S2_y_controller: begin
        M_adder_y = 8'h0c;
        if (M_slowClockEdge_out == 1'h1) begin
          M_y_controller_d = S0_y_controller;
        end
      end
    endcase
    if (M_slowClockEdge_out == 1'h1) begin
      M_register_1_d = M_adder_s;
    end
    out = M_adder_s;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_y_controller_q <= 1'h0;
    end else begin
      M_y_controller_q <= M_y_controller_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_register_1_q <= 1'h0;
    end else begin
      M_register_1_q <= M_register_1_d;
    end
  end
  
endmodule
