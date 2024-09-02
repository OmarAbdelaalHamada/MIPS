module ALU(SrcA,SrcB,ALUControl,ALUResult,Zero);
input [31:0]SrcA,SrcB;
input [2:0]ALUControl;
output reg Zero;
output reg [31:0]ALUResult;
always @(*) begin
    case (ALUControl)
        3'b000 : begin
            ALUResult = SrcA & SrcB;
        end
        3'b001 : begin
            ALUResult = SrcA | SrcB;
        end
        3'b010 : begin
            ALUResult = SrcA + SrcB;
        end
        3'b110 : begin
            ALUResult = SrcA - SrcB;
        end
        3'b111 : begin
            if (SrcA < SrcB) begin
                ALUResult  = 32'b1;
            end 
            else begin 
                ALUResult  = 32'b0;
            end
        end  
        default: begin
            ALUResult = 32'b0;
        end
    endcase
end
always @(*) begin
        Zero = (ALUResult == 32'b0);
end
endmodule