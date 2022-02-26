//Structural model
//TEST BENCH:
module tb(); reg tb_a, tb_b;
 wire tb_sum, tb_carry, tb_diff, tb_bor;
 half_add_sub ints1(
  .a(tb_a),
  .b(tb_b),
  .sum(tb_sum),
  .carry(tb_carry),
  .diff(tb_diff),
  .bor(tb_bor)
);
initial 
  begin
    $dumpfile("half_add_sub.vcd");
    $dumpvars(1);
  end
initial 
  begin
    $monitor("tb_a = %b, tb_b = %b, tb_sum = %b, tb_carry = %b, tb_diff = %b ,tb_bor=%b\n",tb_a,tb_b,tb_sum,tb_carry,tb_diff,tb_bor);
     tb_a = 0; tb_b = 0;
     #10
     tb_a = 0; tb_b = 1;
     #10
     tb_a = 1; tb_b = 0;
     #10
     tb_a = 1; tb_b = 1;
     #10
     $finish; 
  end 
endmodule

//Design Code:
module half_add_sub(
  input a, b,
  inout a_bar,
  output sum, carry, diff, bor // use reg only for behaviour model
);
// Structural Model
  // Sum of half adder
  xor(sum, a, b);
  // Carry of half adder
  and(carry, a, b);
  // diff of half substractor
  xor(diff, a, b);
  // borrow of half subtractor
  not(a_bar, a);
  and(bor, a_bar, b);
endmodule



//Data Flow Model:
//TestBench:
module tb(); reg tb_a, tb_b;
 wire tb_sum, tb_carry, tb_diff, tb_bor;
 half_add_sub ints1(
  .a(tb_a),
  .b(tb_b),
  .sum(tb_sum),
  .carry(tb_carry),
  .diff(tb_diff),
  .bor(tb_bor)
);
initial 
  begin
    $dumpfile("half_add_sub.vcd");
    $dumpvars(1);
  end
initial 
  begin
    $monitor("tb_a = %b, tb_b = %b, tb_sum = %b, tb_carry = %b, tb_diff = %b ,tb_bor=%b\n",tb_a,tb_b,tb_sum,tb_carry,tb_diff,tb_bor);
     tb_a = 0; tb_b = 0;
     #10
     tb_a = 0; tb_b = 1;
     #10
     tb_a = 1; tb_b = 0;
     #10
     tb_a = 1; tb_b = 1;
     #10
     $finish; 
  end 
endmodule

//Design Code:
module half_add_sub(
  input a, b,
  inout a_bar,
  output sum, carry, diff, bor // use reg only for behaviour model
);
// Data flow model
  assign sum=a^b;
  assign carry= a&b;
  assign diff=a^b;
  assign bor= !a&b;
endmodule



//Behaviour model:
//Test Bench:
module tb(); reg tb_a, tb_b;
 wire tb_sum, tb_carry, tb_diff, tb_bor;
 half_add_sub ints1(
  .a(tb_a),
  .b(tb_b),
  .sum(tb_sum),
  .carry(tb_carry),
  .diff(tb_diff),
  .bor(tb_bor)
);
initial 
  begin
    $dumpfile("half_add_sub.vcd");
    $dumpvars(1);
  end
initial 
  begin
    $monitor("tb_a = %b, tb_b = %b, tb_sum = %b, tb_carry = %b, tb_diff = %b ,tb_bor=%b\n",tb_a,tb_b,tb_sum,tb_carry,tb_diff,tb_bor);
     tb_a = 0; tb_b = 0;
     #10
     tb_a = 0; tb_b = 1;
     #10
     tb_a = 1; tb_b = 0;
     #10
     tb_a = 1; tb_b = 1;
     #10
     $finish; 
  end 
endmodule

//Design Code:
module half_add_sub(
  input a, b,
  inout a_bar,
  output reg sum, carry, diff, bor // use reg only for behaviour model
);
// Behaviour model
always @ (*)
  begin
    if (a== 0 && b==0)
      begin
        sum <= 0;
        carry<= 0;
        diff<= 0;
        bor <= 0;
      end
    else if (a== 0 && b==1)
      begin
        sum <= 1;
        carry<= 0;
        diff<= 1;
        bor <= 1;
      end
    else if (a== 1 && b==0)
      begin
        sum <= 1;
        carry<= 0;
        diff<= 1;
        bor <= 0;
      end
    else if (a== 1 && b==1)
      begin
        sum <= 0;
        carry<= 1;
        diff<= 0;
        bor <= 0;
      end
  end      
 endmodule


