module shifLeft16(
    input[15:0] in1,
    output reg[15:0] out );

    always @(*) begin
        out <= in1 << 8;
    end

endmodule 