module adder #(parameter Width = 32)(
input [Width-1:0] PC,
output [Width-1:0] PC_4);
assign PC_4 = PC + 4;
endmodule
