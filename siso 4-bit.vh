//TESTBENCH:
module tb();
  reg tb_clk, tb_A;
  wire tb_B0, tb_B1, tb_B2, tb_B3;
  SISO_4bit ints1(
    .A(tb_A),
    .clk(tb_clk),
    .B0(tb_B0),
    .B1(tb_B1),
    .B2(tb_B2),
    .B3(tb_B3)
  );
  
  initial
    begin
      $dumpfile("SISO_4bit.vcd");
      $dumpvars(1);
    end
  
  initial
    begin
      tb_clk=0;
    end
  
  always
    #10
    tb_clk=~tb_clk;
  initial
    begin
      tb_A=1;
      #20
      tb_A=1;
      #20
      tb_A=0;
      #20
      tb_A=0;
      #20
      tb_A=1;
      #20
      tb_A=1;
      #20
      tb_A=0;
      #20
      tb_A=1;
      #20
      $finish;
    end
  
endmodule


//Design:

module SISO_4bit(clk, A, B0, B1, B2, B3);
  input clk, A;
   output B0, B1, B2, B3;
  D_FF D0(clk, A, B0);
  D_FF D1(clk, B0, B1);
  D_FF D2(clk, B1, B2);
  D_FF D3(clk, B2, B3);
endmodule

module D_FF(clk, din, q);
  input clk, din;
  output reg q;
  always @(posedge clk)
    q <= din;
endmodule
