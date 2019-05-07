module mux2x1(
    input state, 
    input[31:0] in0, 
    input[31:0] in1, 
    output reg[31:0] out);

    always@(state) begin
        case (state)
            1'b0: out = in0;
            1'b1: out = in1; 
        endcase
    end
endmodule