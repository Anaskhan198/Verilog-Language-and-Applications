`timescale 1ns/100ps

`define HLT 0
`define SKZ 1
`define ADD 2
`define AND 3
`define XOR 4
`define LDA 5
`define STO 6
`define JMP 7

module controller (
    input wire          zero,
    input wire  [2:0]   opcode,
    input wire  [2:0]   phase,
    output reg          sel,
    output reg          rd,
    output reg          ld_ir,
    output reg          inc_pc,
    output reg          halt,
    output reg          ld_pc,
    output reg          data_e,
    output reg          ld_ac,
    output reg          wr
);

reg [8:0] result;
reg regH, regA, regZ, regJ, regS;

always @(*) begin
    
    regH = (opcode == `HLT);
    regA = (opcode == `ADD || opcode == `AND || opcode == `XOR || opcode == `LDA);
    regZ = (opcode == `SKZ && zero);
    regJ = (opcode == `JMP);
    regS = (opcode == `STO);
    
    case (phase)
        3'd0 : result = 9'b100000000;
        3'd1 : result = 9'b110000000;
        3'd2 : result = 9'b111000000;
        3'd3 : result = 9'b111000000;
        3'd4 : result = {4'b0001,regH,4'b0000};
        3'd5 : result = {1'b0,regA,7'b0000000};
        3'd6 : result = {1'b0,regA,1'b0,regZ,1'b0,regJ,regS,2'b00};
        3'd7 : result = {1'b0,regA,3'b000,regJ,regS,regA,regS};
    endcase
    {sel, rd, ld_ir, inc_pc, halt, ld_pc, data_e, ld_ac, wr} = result;

end
endmodule
