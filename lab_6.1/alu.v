`timescale 1ns/100ps

`define HLT 0
`define SKZ 1
`define ADD 2
`define AND 3
`define XOR 4
`define LDA 5
`define STO 6
`define JMP 7

module alu #(parameter WIDTH = 8) (
    input wire  [2:0]       opcode,
    input wire  [WIDTH-1:0] in_a,
    input wire  [WIDTH-1:0] in_b,
    output reg  [WIDTH-1:0] alu_out,
    output reg              a_is_zero
);

always @(*) begin
    case(opcode)
        `HLT, `SKZ, `STO, `JMP: alu_out = in_a;
        `ADD:   alu_out = in_a + in_b;
        `AND:   alu_out = in_a & in_b;
        `XOR:   alu_out = in_a ^ in_b;
        `LDA:   alu_out = in_b;
    endcase
    a_is_zero = (in_a == 0);
end
endmodule
