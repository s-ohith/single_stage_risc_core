module alu(
    input wire [31:0] in1,
    input wire [31:0] in2,
    input wire [3:0] sel,
    output reg [31:0] result,
    output wire zero
);

    localparam ALU_ADD  = 4'b0000;
    localparam ALU_SUB  = 4'b0001;
    localparam ALU_AND  = 4'b0010;
    localparam ALU_OR   = 4'b0011;
    localparam ALU_XOR  = 4'b0100;
    localparam ALU_SLT  = 4'b0101;

    always @(*) begin
        case(sel)
            ALU_ADD: result = in1 + in2;
            ALU_SUB: result = in1 - in2;
            ALU_AND: result = in1 & in2;
            ALU_OR : result = in1 | in2;
            ALU_XOR: result = in1 ^ in2;
            ALU_SLT: result = ($signed(in1) < $signed(in2)) ? 32'b1 : 32'b0;
            default: result = 32'b0;
        endcase
    end

    assign zero = (result == 32'b0);

endmodule
