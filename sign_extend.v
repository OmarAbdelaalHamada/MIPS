module sign_extend(in,out);
input [15:0]in;
output reg [31:0]out;
always @(*) begin
    if(in[15]) begin 
        out = {16'hffff,in};
    end
    else begin
        out = {16'h0000,in};
    end
end
endmodule