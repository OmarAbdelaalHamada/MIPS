module MIPS_Top(clk,rst,out);
input clk,rst;
output [31:0]out;
//Wires :
wire MemtoReg_wire,MemWrite_wire,Branch_wire,ALUSrc_wire,
RegDst_wire,RegWrite_wire,Zero_wire,PCSrc,jump;
wire [2:0]ALUControl_wire;
wire [5:0]Op_wire,Funct_wire;
wire [4:0]A1_wire,A2_wire,A3_wire,instruction_bus_15to11;
wire [15:0]Sign_extend_in_bus;
wire [31:0]RD1_wire,RD2_wire,WD3_wire,Sign_extend_out_bus,SrcB_wire,ALUResult_wire,
RD_Data_mem_wire,PC_in_wire,PC_out_wire,instruction_bus,Shifter_out_bus,
PCBranch_wire,PCPlus4_wire,ShiftRegisterPcIn,PC_in_wire_to_Mux;
//instantiations :
//control unit :
Control_Unit Control_unit(.Op(Op_wire),.Funct(Funct_wire),.MemtoReg(MemtoReg_wire),
.MemWrite(MemWrite_wire),.Branch(Branch_wire),.ALUSrc(ALUSrc_wire),
.RegDst(RegDst_wire),.RegWrite(RegWrite_wire),.ALUControl(ALUControl_wire),.jump(jump));
//register file :
Register_File reg_file(.clk(clk),.rst(rst),.A1(A1_wire),.A2(A2_wire),
.A3(A3_wire),.WD3(WD3_wire),.WE3(RegWrite_wire),.RD1(RD1_wire),.RD2(RD2_wire));
//ALU mux :
MUX alu_mux(.in1(Sign_extend_out_bus),.in0(RD2_wire),.sel(ALUSrc_wire),.out(SrcB_wire));
//ALU :
ALU The_ALU(.SrcA(RD1_wire),.SrcB(SrcB_wire),.ALUControl(ALUControl_wire),
.ALUResult(ALUResult_wire),.Zero(Zero_wire));
//Data memory :
Data_Memory Data_mem(.clk(clk),.WE(MemWrite_wire),
.A(ALUResult_wire),.WD(RD2_wire),.RD(RD_Data_mem_wire));
//Data memory Mux:
MUX data_mem_mux(.in1(RD_Data_mem_wire),.in0(ALUResult_wire),
.sel(MemtoReg_wire),.out(WD3_wire));
//WD3 Mux:
MUX #(.DATA_WIDTH(5))WD3_Mux(.in1(instruction_bus_15to11),.in0(A2_wire),
.sel(RegDst_wire),.out(A3_wire));
//PCSrc:
assign PCSrc = Zero_wire & Branch_wire;
//PC :
PC program_counter(.clk(clk),.rst(rst),.PC_in(PC_in_wire),.PC(PC_out_wire));
//Instruction Memory :
Instruction_Memory Instruction_Mem(.A(PC_out_wire),.RD(instruction_bus));
//instruction bus :
assign Op_wire = instruction_bus[31:26];
assign Funct_wire = instruction_bus[5:0];
assign A1_wire = instruction_bus[25:21];
assign A2_wire = instruction_bus[20:16];
assign instruction_bus_15to11 = instruction_bus[15:11];
assign Sign_extend_in_bus = instruction_bus[15:0];
//sign_extend
sign_extend Sign_extend(.in(Sign_extend_in_bus),.out(Sign_extend_out_bus));
//Shifter :
shift_left_twice Shifter(.in(Sign_extend_out_bus),.out(Shifter_out_bus));
//Branch adder
adder Branch_adder(.in1(Shifter_out_bus),.in2(PCPlus4_wire),.out(PCBranch_wire));
//jump_shifter :
shift_left_twice jump_shifter(.in({6'd0, instruction_bus[25:0]}),.out(ShiftRegisterPcIn));
//jump_MUX :
MUX jump_MUX(.in1({PCPlus4_wire[31:28],ShiftRegisterPcIn[27:0]}),.in0(PC_in_wire_to_Mux),.sel(jump),.out(PC_in_wire));
//PC adder 
adder PC_adder(.in1(PC_out_wire),.in2(32'h00004),.out(PCPlus4_wire));
//PC_Mux :
MUX PC_Mux(.in1(PCBranch_wire),.in0(PCPlus4_wire),.sel(PCSrc),.out(PC_in_wire_to_Mux));
assign out = RD_Data_mem_wire;
endmodule