module Control_Unit(Op,Funct,MemtoReg,MemWrite,Branch,ALUSrc,RegDst,RegWrite,ALUControl,jump);
input [5:0]Op;
input [5:0]Funct;
output [2:0]ALUControl;
output MemtoReg,MemWrite,Branch,ALUSrc,RegDst,RegWrite,jump;
wire [1:0]ALUOp;
Main_decoder main_decoder(Op,MemtoReg,MemWrite,Branch,ALUSrc,RegDst,RegWrite,ALUOp,jump);
ALU_Decoder alu_decoder(Funct,ALUOp,ALUControl);
endmodule
