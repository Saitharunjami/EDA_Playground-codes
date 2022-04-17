//TESTBENCH:

module tb();
reg tb_J, tb_K, tb_clk, tb_Qn;
wire tb_Qn_1;
JK_FF ints1(
.J(tb_J),
.K(tb_K),
.clk(tb_clk),
.Qn(tb_Qn),
.Qn_1(tb_Qn_1)
);
initial
begin
$dumpfile("JK_FF.vcd");
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
tb_J = 0; tb_K = 0;
#20
tb_J = 0; tb_K = 1;
#20
tb_J = 1; tb_K = 0;
#20
tb_J = 1; tb_K = 1;
#20
$finish;
end
endmodule


//DESIGN:


module JK_FF(
input J, K, clk, Qn,
output reg Qn_1
);
always @ (posedge clk)
begin
if (J == 0 && K == 0)
Qn_1 = Qn;
else if (J == 0 && K == 1)
Qn_1 = 1;
else if (J == 1 && K == 0)
Qn_1 = 1;
else
Qn_1 = 1'bz;
end
endmodule
EP
