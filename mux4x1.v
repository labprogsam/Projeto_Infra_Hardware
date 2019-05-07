module mux4x1(
    input [1:0] state, 
    input[31:0] in0, 
    input[31:0] in1, 
    input[31:0] in2, 
    input[31:0] in3,  
    output reg[31:0] out);

    always@(*) begin
        case (state)
            2'b00: out = in0;
            2'b01: out = in1; 
            2'b10: out = in2;
            2'b11: out = in3;
        endcase
    end
endmodule