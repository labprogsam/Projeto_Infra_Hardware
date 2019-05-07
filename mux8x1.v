module mux8x1(
    input [2:0] state, 
    input[31:0] in0, 
    input[31:0] in1, 
    input[31:0] in2, 
    input[31:0] in3, 
    input[31:0] in4,
    input[31:0] in5,
    input[31:0] in6,
    input[31:0] in7,
    output reg[31:0] out);

    always@(state) begin
        case (state)
            3'b000: out = in0;
            3'b001: out = in1; 
            3'b010: out = in2;
            3'b011: out = in3;
            3'b100: out = in4;
            3'b101: out = in5;
            3'b110: out = in6;
            3'b111: out = in7;
        endcase
    end
endmodule