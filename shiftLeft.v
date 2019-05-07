module shiftLeft(
    input[31:0] in1,
    output reg[31:0] out );

    always @(*) begin
        out <= in1 << 2;
    end

endmodule 