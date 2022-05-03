//D FLIPFLOPS

//TESTBENCH:

module tb();
  reg tb_D, tb_clr_bar, tb_preset_bar, tb_clk, tb_Qn; 
  wire tb_Qn_1;
  D_FF ints1(
    .D(tb_D),
    .clr(tb_clr_bar),
    .preset(tb_preset_bar),
    .clk(tb_clk),
    .Qn_1(tb_Qn_1)
  );
  initial 
    begin
      $dumpfile("D_FF.vcd");
      $dumpvars(1); 
    end
  
  initial
    begin
      tb_Qn = 0 ; tb_clk = 0;
    end
  always
    #10
    tb_clk = ~ tb_clk;
  initial
    begin
      tb_clr_bar = 0; tb_preset_bar = 1; tb_D = 0;
      #20
      tb_clr_bar = 1; tb_preset_bar = 0; tb_D=0;
      #20
      tb_clr_bar= 1; tb_preset_bar = 1; tb_D = 0;
      #20
      tb_clr_bar = 1; tb_preset_bar = 1; tb_D = 1;
      #20
      $finish;
    end
endmodule



//Design code:

module D_FF(
  input D, clr, preset, clk, 
  output reg Qn_1
);
  always @ (posedge clk) 
    begin
      if ( clr == 0 && preset == 1 && (D ==0 || D==1 ) ) 
        Qn_1 = 0;
      else if ( clr == 1 && preset == 0 && (D ==0 || D==1 ))
        Qn_1 = 1;
      else if ( clr == 1 && preset == 1 && D==1 ) 
        Qn_1 = 1;
      else Qn_1=0;
       end
        endmodule
