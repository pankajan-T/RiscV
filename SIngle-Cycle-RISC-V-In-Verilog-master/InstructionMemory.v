module instructionmemory #(parameter Width = 32)(
    input [Width-1:0] address,
    output [Width-1:0] ReadData
    );

reg [Width-1:0] Mem[63:0];


initial




begin
Mem[0] = 32'h002081B3; // add $1, $2, $3
Mem[4] = 32'h403202B3; // sub $4, $3, $5
Mem[8] = 32'h00308383; // lw $7, 3($1)
Mem[12] = 32'h0013F333; // and $7, $1, $6
Mem[16] = 32'h001112B3; // sll $5, $2, $1
Mem[20] = 32'h001122B3; // slt $5, $2, $1
Mem[24] = 32'h00210463; // beq $2, $3, 4 // 4 is offset
Mem[28] = 32'h001132B3; // sltu $5, $2, $1
Mem[32] = 32'h001142B3; // xor $5, $2, $1
Mem[36] = 32'h001152B3; // srl $5, $2, $1
Mem[40] = 32'h401152B3; // sra $5, $2, $1
Mem[44] = 32'h008002EF; // jal $5, 2 
Mem[48] = 32'h00110293; // addi $5, $2, 1
Mem[52] = 32'h00312293; // slti $5, $2, 3
Mem[56] = 32'h00517293; // andi $5, $2, 5
Mem[60] = 32'h00211293; // slli $5, $2, 2
Mem[64] = 32'h002102E7; // jar $5, $2, 2  // will jump on instruction 4

end


assign ReadData = Mem[address];
endmodule
