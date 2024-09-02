module PC(clk,rst,PC_in,PC);
input clk,rst;
output reg [31:0]PC;
input [31:0]PC_in;
always @(posedge clk or posedge rst) begin
    if(rst) begin
        PC <= 32'h0;
    end
    else begin
        PC <= PC_in;
    end
end
endmodule