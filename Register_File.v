module Register_File(clk,rst,A1,A2,A3,WD3,WE3,RD1,RD2);
input clk,rst,WE3;
input [4:0]A1,A2,A3;
input [31:0]WD3;
output reg [31:0]RD1,RD2;
reg [31:0] registers [31:0];
integer  i = 0;
always @(*) begin
        RD1 = registers[A1];
        RD2 = registers[A2];
end
always @(posedge clk or posedge rst) begin
    if(rst) begin
        for(i = 0 ; i < 32 ; i = i + 1) begin
            registers[i] <= 0;
        end
    end 
    else if (WE3) begin
            registers[A3] <= WD3;
    end 
end
endmodule