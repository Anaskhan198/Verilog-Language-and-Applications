`timescale 1ns/100ps

module driver #(parameter WIDTH = 8) (
    input wire              data_en,
    input wire [WIDTH-1:0]  data_in,
    output reg [WIDTH-1:0]  data_out
);

always @(*) begin
    data_out = (data_en)? data_in : 'bz;
end

endmodule
