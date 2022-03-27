//TestBench:
module tb();
reg tb_i0,tb_i1;
wire tb_y0,tb_y1,tb_y2,tb_y3;
decode_2x4 inst1(
.i0(tb_i0),
.i1(tb_i1),
.y0(tb_y0),
.y1(tb_y1),
.y2(tb_y2),
.y3(tb_y3)
);
initial
begin
$dumpfile("allgates.vcd");
$dumpvars(1);
end
initial
begin
$monitor("tb_i0=%b,tb_i1=%b,tb_y0=%b,tb_y1=%b,tb_y2=%b,tb_y3=%b",tb_i0,tb_i1,tb_y0,tb_y1,tb_y2,tb_y3);
tb_i0 = 0;tb_i1 = 0;
#10
tb_i0 = 1; tb_i1 = 0;
#10
tb_i0 = 0; tb_i1 = 1;
#10
tb_i0 = 1; tb_i1 = 1;
#10
$finish;
end
endmodule


//Design:
module decode_2x4(
input i0,i1,
output y0,y1,y2,y3
);
assign y0 = !i0 & !i1;
assign y1 = i0 & !i1;
assign y2 = !i0 & i1;
assign y3 = i1 & i0;
endmodule
