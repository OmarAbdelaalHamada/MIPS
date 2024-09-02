module Data_Memory(clk,WE,A,WD,RD);
parameter DATA_WIDTH = 32;
input clk,WE;
input [DATA_WIDTH -1:0]A,WD;
output reg [DATA_WIDTH -1:0]RD;
reg [DATA_WIDTH -1:0] Data_Mem [511:0];
always @(posedge clk) begin
    if(WE) begin 
        Data_Mem[A[31:0]] <= WD;
    end
end
always @(*) begin
    RD = Data_Mem[A[31:0]];
end
endmodule