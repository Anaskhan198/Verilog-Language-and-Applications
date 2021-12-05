`timescale 1ns/100ps

module multiplexor #(parameter WIDTH = 5) (
    input wire sel,
    input wire [WIDTH-1:0] in0,
    input wire [WIDTH-1:0] in1,
    output reg [WIDTH-1:0] mux_out
);

always @(*) begin
    case(sel)
        'd0: mux_out = in0;
        'd1: mux_out = in1;
        default: mux_out = in0;
    endcase
end

endmodule
