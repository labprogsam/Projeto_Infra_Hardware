module signExtend16x32(
    input[15:0] in1,
    output reg[31:0] out );

    always @(*) begin
        out = {16'b0000000000000000, in1};
    end

endmodule