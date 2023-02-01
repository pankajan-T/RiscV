`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/19/2023 03:06:50 PM
// Design Name: 
// Module Name: PC Counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PCCounter    #(parameter Width = 32) 
(input clk, PCen, [Width-1:0] PC1,
 output logic [Width-1:0] PC);

always@(posedge clk)

begin

if(PCen == 0)

PC <= PC;

else 

PC <= PC1;

end

endmodule
