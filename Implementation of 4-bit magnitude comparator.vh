//Testbench:

module tb();
reg [3:0]tb_A;
reg [3:0]tb_B;
wire tb_L, tb_G, tb_E;
mag_comp_4bit i1(
.A(tb_A),
.B(tb_B),
.L(tb_L),
.G(tb_G),
.E(tb_E)
);
initial
begin
$dumpfile("mag_comp_4bit.vcd");
$dumpvars(1);
end
initial
begin
tb_A = 10; tb_B = 5;
#20
tb_A = 5; tb_B = 6;
#20
tb_A = 10; tb_B=10;
#20
$finish;
end
endmodule


//DESIGN:

module mag_comp_4bit(
input [3:0]A, [3:0]B,
output reg L, G, E
);
always @ (*)
begin
if (A[3] > B[3])
begin
L = 0;
G = 1;
E = 0;
end
else if (A[3] < B[3])
begin
L = 1;
G = 0;
E = 0;
end
else if (A[3] == B[3] && A[2] > B[2])
begin
L = 0;
G = 1;
E = 0;
end
else if (A[3] == B[3] && A[2] < B[2])
begin
L = 1;
G = 0;
E = 0;
end
else if (A[3] == B[3] && A[2] == B[2] && A[1] > B[1])
begin
L = 0;
G = 1;
E = 0;
end
else if (A[3] == B[3] && A[2] == B[2] && A[1] < B[1])
begin
L = 1;
G = 0;
E = 0;
end
else if (A[3] == B[3] && A[2] == B[2] && A[1] == B[1] && A[0] > B[0])
begin
L = 0;
G = 1;
E = 0;
end
else if (A[3] == B[3] && A[2] == B[2] && A[1] == B[1] && A[0] < B[0])
begin
L = 1;
G = 0;
E = 0;
end
else
begin
L = 0;
G = 0;
E = 1;
end
end
endmodule
