module instr_mem(
input wire [31:0]pc,
output reg [31:0]instruction

    );
    reg [31:0] memory [0:255];
    
    initial
    begin
    $readmemh("D:\\Vivado\\risc\\risc.sim\\sim_1\\behav\\xsim\\program.mem", memory);
    end
    
    always@(*)
    begin
    instruction<=memory[pc[9:2]];
    end
endmodule
