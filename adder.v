module adder(in1,in2,out);
parameter WIDHT = 32;
input [WIDHT -1:0]in1,in2;
output [WIDHT -1:0]out;
assign out = in1 + in2;
endmodule