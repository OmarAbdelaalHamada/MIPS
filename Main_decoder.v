module Main_decoder(Op,MemtoReg,MemWrite,Branch,ALUSrc,RegDst,RegWrite,ALUOp,jump);
input [5:0]Op;
output reg MemtoReg,MemWrite,Branch,ALUSrc,RegDst,RegWrite,jump;
output reg[1:0]ALUOp;
always @(*) begin
    casex (Op)
        6'b000000: begin //R-type instructions
            MemtoReg = 0;
            MemWrite = 0;
            Branch   = 0;
            ALUSrc   = 0;
            RegDst   = 1;
            RegWrite = 1;
            jump = 0;
            ALUOp    = 2'b10;
        end
        6'b100011: begin // lw instruction
            MemtoReg = 1;
            MemWrite = 0;
            Branch   = 0;
            ALUSrc   = 1;                   
            RegDst   = 0;
            RegWrite = 1;
            jump = 0;
            ALUOp    = 2'b00;
        end
        6'b101011 : begin // sw instruction
            MemtoReg = 1; // don't care
            MemWrite = 1;
            Branch   = 0;
            ALUSrc   = 1;
            RegDst   = 0; // don't care
            RegWrite = 0;
            jump = 0;
            ALUOp    = 2'b00;
        end
        6'b000100: begin //beq instruction
            MemtoReg = 1; // don't care
            MemWrite = 0;
            Branch   = 1;
            ALUSrc   = 0;
            RegDst   = 0; // don't care
            RegWrite = 0;
            jump = 0;
            ALUOp    = 2'b01;
        end
        6'b001000: begin //addi instruction
            MemtoReg = 0; 
            MemWrite = 0;
            Branch   = 0;
            ALUSrc   = 1;
            RegDst   = 0; 
            RegWrite = 1;
            jump = 0;
            ALUOp    = 2'b00;
        end
        6'b000010: begin //addi instruction
            MemtoReg = 0; 
            MemWrite = 0;
            Branch   = 0;
            ALUSrc   = 0;
            RegDst   = 0; 
            RegWrite = 0;
            jump = 1;
            ALUOp    = 2'b00;
        end
        default : begin
            MemtoReg = 0; 
            MemWrite = 0;
            Branch   = 0;
            ALUSrc   = 0;
            RegDst   = 0; 
            RegWrite = 0;
            jump = 0;
            ALUOp    = 2'b00;
        end
    endcase
end
endmodule