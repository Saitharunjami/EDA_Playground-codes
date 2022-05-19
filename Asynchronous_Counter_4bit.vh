//Asynchronous_Counter_4bit
//Testbench:
module tb();
reg tb_clk, tb_T;
wire tb_Q0, tb_Q1, tb_Q2, tb_Q3;
asyn_counter_4bit ints1(
.T(tb_T),
.clk(tb_clk),
.Q0(tb_Q0),
.Q1(tb_Q1),
.Q2(tb_Q2),
.Q3(tb_Q3)
);
initial
begin
$dumpfile("counter_4bit.vcd");
$dumpvars(1);
end
initial
begin
tb_clk=1;
tb_T=1;
end
always
#10
tb_clk=~tb_clk;
initial
begin
#20
tb_T=1;
#320
$finish;
end
endmodule


//Design Code:

module asyn_counter_4bit (clk, T, Q0, Q1, Q2, Q3);
input clk, T;
output Q0, Q1, Q2, Q3;
T_FF D0(clk, T, Q0);
T_FF D1(clk, Q0, Q1);
T_FF D2(clk, Q1, Q2);
T_FF D3(clk, Q2, Q3);
endmodule
module T_FF(clk,Tin, Q);
input clk, Tin;
output reg Q;
initial
Q <=1 'b0;
always@(negedge clk)
begin
if (Tin == 1)
Q <= ~Q;
else
Q <=Q;
end
endmodule
