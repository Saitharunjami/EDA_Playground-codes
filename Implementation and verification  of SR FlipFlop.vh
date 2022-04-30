//IMPLEMENTATION AND VERIFICATION of SR FlipFlop
//TESTBENCH:

module tb();
reg tb_S, tb_R, tb_clk, tb_Qn;
wire tb_Qn_1;
SR_FF ints1(
.S(tb_S),
.R(tb_R),
.clk(tb_clk),
.Qn(tb_Qn),
.Qn_1(tb_Qn_1)
);
initial
begin
$dumpfile("SR_FF.vcd");
$dumpvars(1);
end
initial
begin
tb_Qn = 0;
tb_clk = 0;
end
always
#10
tb_clk = ~tb_clk;
initial
begin
tb_S = 0; tb_R = 0;
#20
tb_S = 0; tb_R = 1;
#20
tb_S = 1; tb_R = 0;
#20
tb_S = 1; tb_R = 1;
#20
$finish;
end
endmodule


//DESIGN CODE:

module SR_FF(
input S, R, clk, Qn,
output reg Qn_1
);
always @ (posedge clk)
begin
if (S == 0 && R == 0)
Qn_1 = Qn;
else if (S == 0 && R == 1)
Qn_1 = 0;
else if (S == 1 && R == 0)
Qn_1 = 1;
else
Qn_1 = 1'bz;
end
endmodule
