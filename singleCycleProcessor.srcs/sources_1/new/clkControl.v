`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2023 12:06:38 PM
// Design Name: 
// Module Name: clkControl
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


module clkControl(
input clk,
output reg pcTrig, memTrig
    );
reg [2:0]count;

initial count = 2'b00;

always@(posedge clk)
begin
count= count+1;
end

always@(posedge clk)
begin
if(count == 2'b00)
pcTrig <=  1;
if(count == 2'b10)
memTrig <= 0;

end

endmodule
