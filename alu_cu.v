module alu_cu (
    input  [1:0] alu_op,
    input  [2:0] funct3,
    input  [6:0] funct7,
    output reg [3:0] alu_ctrl
);

    always @(alu_op or funct3 or funct7) begin
        case (alu_op)
            2'b00: alu_ctrl = 4'b0000; // ADD (lw/sw)
            2'b01: alu_ctrl = 4'b0001; // SUB (beq/bne)
            2'b10: begin // R-type
                case ({funct7, funct3})
                    {7'b0000000, 3'b000}: alu_ctrl = 4'b0000; // ADD
                    {7'b0100000, 3'b000}: alu_ctrl = 4'b0001; // SUB
                    {7'b0000000, 3'b111}: alu_ctrl = 4'b0010; // AND
                    {7'b0000000, 3'b110}: alu_ctrl = 4'b0011; // OR
                    {7'b0000000, 3'b100}: alu_ctrl = 4'b0100; // XOR
                    default: alu_ctrl = 4'b1111;
                endcase
            end
            2'b11: begin // I-type
                case (funct3)
                    3'b000: alu_ctrl = 4'b0000; // ADDI
                    3'b111: alu_ctrl = 4'b0010; // ANDI
                    3'b110: alu_ctrl = 4'b0011; // ORI
                    default: alu_ctrl = 4'b1111;
                endcase
            end
            default: alu_ctrl = 4'b1111;
        endcase
    end

endmodule
