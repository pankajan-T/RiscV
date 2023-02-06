module Registerfile #(parameter Width = 32)(

input clk, RegWrite, [4:0] Reg1, [4:0] Reg2, [4:0] WriteDataTrig, [Width-1:0] WD1,

output [Width-1:0] RegReadData1, RegReadData2);


reg [Width-1:0] Register [Width-1:0];
initial


begin

Register[1] = 32'h00000001;
Register[2] = 32'h00000002;
Register[3] = 32'h00000003;
Register[4] = 32'h00000004;
Register[5] = 32'h00000005;
Register[6] = 32'h00000006;
Register[7] = 32'h00000007;
Register[8] = 32'h00000008;
Register[9] = 32'h00000009;

end

always @(clk)

begin

if(RegWrite)
Register[WriteDataTrig] <= WD1;

end

assign RegReadData1 = (Reg1 != 0) ? Register[Reg1] : 0;
assign RegReadData2 = (Reg2 != 0) ? Register[Reg2] : 0;

endmodule
