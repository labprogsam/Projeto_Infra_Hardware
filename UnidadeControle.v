module UnidadeControle (

    input clock,
    input reset,
    input [5:0] op,
    input [5:0] funct,
    output reg [2:0]IorD,
    output reg MemOp,
    output reg [2:0]ALUSrcA,
    output reg [2:0]ALUSrcB,
    output reg [2:0]ALUOp,
    output reg [1:0]PCSource,
    output reg PCWrite,
    output reg [2:0] Cond,
    output reg EPCWrite,
    output reg IRWrite,
    output reg AWrite,
    output reg BWrite,
    output reg ALUWrite
    
);

    reg [6:0] state;

    parameter Reset = 7'd0;
    parameter Fetch = 7'd1;
    parameter Wait_fetch = 7'd2;
    parameter Decode = 7'd3;
    parameter SaveResult = 7'd4;
    
    //Funcs
    
    parameter ADD = 7'h20;

    initial begin
        state = Fetch;
    end
	
    always @ (posedge clock or reset) begin
		if (reset) begin
			state = Reset;
		end
        case(state) 

            Fetch: begin

                IorD = 3'b000;
                MemOp = 1'b0;
                ALUSrcA = 3'b000;
                ALUSrcB = 3'b001;
                ALUOp = 3'b001;
                PCSource = 2'b00;
                PCWrite = 1'b1;
                Cond = 3'b011;
                EPCWrite = 1'b1;
                state = Wait_fetch;

            end

            Wait_fetch: begin

                IRWrite = 1'b1;
                state = Decode;

            end
            
            Decode: begin

                ALUSrcA = 3'b000;
                ALUSrcB = 3'b011;
                ALUOp = 3'b001;
                ALUWrite = 1'b1;
                AWrite = 1'b1;
                BWrite = 1'b1;
                
                case(op)
                    6'b000000: begin

                        case(funct) 

                            6'b100000: begin
                                state = ADD;
                            end

                        endcase
                    end
                endcase
            end

            ADD: begin

                ALUSrcA = 3'b011;
                ALUSrcB = 3'b000;
                ALUOp = 3'b001;
                ALUWrite = 1'b1;
            end

            Reset: begin

            //Reseta tudo;

            end

        endcase    

    end 

endmodule 