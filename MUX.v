module MUX(in1,in0,sel,out);
parameter DATA_WIDTH = 32;
input [DATA_WIDTH-1:0]in1,in0;
input sel;
output [DATA_WIDTH-1:0]out;
assign out = (sel)?in1:in0;
endmodule