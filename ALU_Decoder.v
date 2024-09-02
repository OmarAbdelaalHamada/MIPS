module ALU_Decoder(Funct,ALUOp,ALUControl);
input [5:0]Funct;
input [1:0]ALUOp;
output reg [2:0]ALUControl;
always @(*) begin
casex (ALUOp)
    2'b00: begin
        ALUControl = 3'b010;
    end
    2'b01: begin
        ALUControl = 3'b110;
    end
    default : begin
        case (Funct)
            6'b100000 : begin
                ALUControl = 3'b010;
            end  
            6'b100010 : begin
                ALUControl = 3'b110;
            end  
            6'b100100 : begin
                ALUControl = 3'b000;
            end  
            6'b100101 : begin
                ALUControl = 3'b001;
            end  
            6'b101010 : begin
                ALUControl = 3'b111;
            end  
            default : begin
                ALUControl = 3'b000;
            end
        endcase
    end
endcase
end
endmodule
