// Multiplexer at Switch level

module mux (out, sel, in1, in2);
  output out; //mux output
  input sel, in1, in2; //mux inputs
  wire w; //internal wire
  
  inv_sw l1(w, sel); //instantiate inverter module
  
  cmos c1(out, in1, w, sel); //instantiate cmos switches
  cmos c2(out, in2, sel, w);
  
  
endmodule
  
