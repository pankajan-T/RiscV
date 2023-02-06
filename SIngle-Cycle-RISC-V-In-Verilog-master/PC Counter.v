module PCCounter #(parameter Width = 32) 
(input clk, [Width-1:0] PCnext, output reg [Width-1:0] PC);


always@(posedge clk)
begin


PC <= PCnext;
end

endmodule
