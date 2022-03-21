//Testbench:

module tb();
reg tb_I;
reg [1:0]tb_S;
wire [3:9]tb_Y;
demux_1x4 i1 (
.I(tb_I),
.S(tb_S),
.Y(tb_Y)
);
initial
begin
$dumpfile("dumux_1x4.vcd");
$dumpvars(1);
end
initial
begin
tb_I = 1; tb_S = 0;
#10
tb_S = 1;
#10
tb_I = 0; tb_S = 2;
#10
tb_I = 1; tb_S = 3;
#10
$finish;
end
endmodule


//Design code:
// Demultiplexer design code
module demux_1x4 (
input I,
input [1:0]S,
output reg [3:0]Y
);
always @(*)
begin
case(S)
2'b00:
begin
Y[0] = I;
Y[1] = 0;
Y[2] = 0;
Y[3] = 0;
end
2'b01:
begin
Y[0] = 0;
Y[1] = I;
Y[2] = 0;
Y[3] = 0;
end
2'b10:
begin
Y[0] = 0;
Y[1] = 0;
Y[2] = I;
Y[3] = 0;
end
2'b11:
begin
Y[0] = 0;
Y[1] = 0;
Y[2] = 0;
Y[3] = I;
end
endcase
end
endmodule
