//TestBench 


module tb(); // Test-bench will not have any input or outputs
  
  reg tb_i0, tb_i1, tb_i2, tb_i3, tb_i4, tb_i5, tb_i6, tb_i7;
  wire tb_y0, tb_y1, tb_y2;
  
// instantiation or port-map
  
  enc ints1(
    .i0(tb_i0),
    .i1(tb_i1),
    .i2(tb_i2),
    .i3(tb_i3),
    .i4(tb_i4),
    .i5(tb_i5),
    .i6(tb_i6),
    .i7(tb_i7),
    .y0(tb_y0),
    .y1(tb_y1),
    .y2(tb_y2)
  );
  
  // To see output in waveform
  
  initial
    begin
      $dumpfile("enc.vcd");
      $dumpvars(1);
    end
  
  // Verify the outputs for all the possible inputs
  
  initial
    begin
      $monitor("tb_i0 = %b, tb_i1 = %b, tb_i2 = %b, tb_i3 = %b,tb_i4 = %b,tb_i5 = %b,tb_i6 = %b,tb_i7 = %b, tb_y0= %b,tb_y1= %b,tb_y2= %b \n",tb_i0, tb_i1, tb_i2, tb_i3, tb_i4, tb_i5, tb_i6, tb_i7,tb_y0, tb_y1, tb_y2 );
      
      tb_i0 = 1; tb_i1 = 0;tb_i2 = 0;tb_i3 = 0;tb_i4 = 0;tb_i5 = 0;tb_i6 = 0; tb_i7 = 0;
      #10 // In nano seconds
      
      tb_i0 = 0; tb_i1 = 1;tb_i2 = 0;tb_i3 = 0;tb_i4 = 0;tb_i5 = 0;tb_i6 = 0; tb_i7 = 0;
      #10
      
      tb_i0 = 1; tb_i1 = 0;tb_i2 = 1;tb_i3 = 0;tb_i4 = 0;tb_i5 = 0;tb_i6 = 0; tb_i7 = 0;
      #10
      
      tb_i0 = 1; tb_i1 = 0;tb_i2 = 0;tb_i3 = 1;tb_i4 = 0;tb_i5 = 0;tb_i6 = 0; tb_i7 = 0;
      #10
      
      tb_i0 = 1; tb_i1 = 0;tb_i2 = 0;tb_i3 = 0;tb_i4 = 1;tb_i5 = 0;tb_i6 = 0; tb_i7 = 0;
      #10 // In nano seconds
      
      tb_i0 = 1; tb_i1 = 0;tb_i2 = 0;tb_i3 = 0;tb_i4 = 0;tb_i5 = 1;tb_i6 = 0; tb_i7 = 0;
      #10
      
      tb_i0 = 1; tb_i1 = 0;tb_i2 = 0;tb_i3 = 0;tb_i4 = 0;tb_i5 = 0;tb_i6 = 1; tb_i7 = 0;
      #10
      
      tb_i0 = 1; tb_i1 = 0;tb_i2 = 0;tb_i3 = 0;tb_i4 = 0;tb_i5 = 0;tb_i6 = 0; tb_i7 = 1;
      #10
      
      $finish;
      
    end 
endmodule

//Design
module enc (
  input i0, i1, i2, i3, i4, i5, i6, i7,
  output y0, y1, y2
);
  
  assign y2 = i4|i5|i6|i7;
  assign y1 = i2|i3|i6|i7;
  assign y0 = i1|i3|i5|i7;
  
endmodule
