module add #(parameter Width = 32) 
(input [Width-1:0] Add1, Add2,
output [Width-1:0] OutAdd);


assign OutAdd = Add1 + Add2;



endmodule

