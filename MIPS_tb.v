module MIPS_tb;
reg clk,rst;
MIPS_Top MIPS(clk,rst);
initial begin
    clk = 1;
    forever begin
        #5 clk = ~clk;
    end
end
initial begin
$readmemh("Data_mem.dat",MIPS.Data_mem.Data_Mem);
$readmemh("Instruction_mem.dat",MIPS.Instruction_Mem.instructions_mem);
rst = 1;
@(negedge clk);
rst = 0 ;
#155;
$stop;
end   
endmodule