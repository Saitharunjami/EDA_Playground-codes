//TESTBENCH :
// testbench code

module tb();
reg [7:0]tb_I;
reg [2:0]tb_S;
wire tb_Y;
mux_8x1_v i1(
.I(tb_I),
.S(tb_S),
.Y(tb_Y)
);
initial
begin
$dumpfile("mux_8x1.vcd");
$dumpvars(1);
end
initial
begin
tb_I[0] = 0; tb_I[1] = 1; tb_I[2] = 0; tb_I[3] = 0; tb_I[4] = 1; tb_I[5] = 0; tb_I[6] = 1; tb_I[7] = 1; tb_S = 4;
#10
tb_S = 1;
#10
tb_S = 2;
#10
$finish;
end
endmodule


//Design code:
// multiplexer design code
module mux_8x1_v (
input [7:0]I, [2:0]S,
output reg Y
);
always @(*)
begin
case(S)
3'b000: Y = I[0];
3'b001: Y = I[1];
3'b010: Y = I[2];
3'b011: Y = I[3];
3'b100: Y = I[4];
3'b101: Y = I[5];
3'b110: Y = I[6];
3'b111: Y = I[7];
endcase
end
endmodule
