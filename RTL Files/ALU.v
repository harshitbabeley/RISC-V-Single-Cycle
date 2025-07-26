module ALU (
    input [3:0] ALUCtl,
    input [31:0] A,B,
    output reg [31:0] ALUOut,
    output zero
);
    // Zero is set if ALUOut is zero
    assign zero = (ALUOut == 0);

    always @(*) begin
        case (ALUCtl)
            4'b0000: ALUOut = A & B;         // AND
            4'b0001: ALUOut = A | B;         // OR
            4'b0010: ALUOut = A + B;         // ADD
            4'b0110: ALUOut = A - B;         // SUB
            4'b0011: ALUOut = A ^ B;         // XOR
            4'b1000: ALUOut = A << B[4:0]; // SLL / SLLI (Shift Left Logical)
            4'b1001: ALUOut = A >> B[4:0]; // SRL / SRLI (Shift Right Logical)
            4'b1010: ALUOut = $signed(A) >>> B[4:0]; // SRA / SRAI (Shift Right Arithmetic)
            4'b0111: ALUOut = ($signed(A) < $signed(B)) ? 32'b1 : 32'b0;  // SLT / SLTI (signed comparison)
            4'b1011: ALUOut = (A < B) ? 32'b1 : 32'b0;  // SLTU / SLTIU (unsigned comparison)
            4'b1100: ALUOut = ~(A | B);      // NOR
            default: ALUOut = 32'b0;         // Default case
        endcase
    end
    
endmodule

