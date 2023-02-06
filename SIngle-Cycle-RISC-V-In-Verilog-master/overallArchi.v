module overallArchi(input clk);


wire [63:0] Writedata,immediateout, RD1,RD2, ALUinput2, ALUOut, DataOutput, shiftoutput,Mux10output;
wire [31:0] Instruct, PCoutput, PCPlus4;
wire [31:0] branchaddress,PCinput;
wire [3:0] Control; 
wire [1:0] Aluop;
wire [31:0]PCaddress;
wire MemtoReg;





add Adressoffset(PCoutput,shiftoutput[31:0],branchaddress); //Adder for offset immediate

MUX #(32)MuxPC(PCPlus4,branchaddress,andoutput,PCaddress);  //PC selection

PCCounter PCcount(clk,PCinput,PCoutput);

adder Add4(PCoutput,PCPlus4);       //adder for PC+4



instructionmemory InstMem(PCoutput,Instruct);  //Instruction memory

shift S12(immediateout,shiftoutput);

MUX #(32)M9(PCaddress,ALUOut[31:0],jump,PCinput);

Registerfile RegFile(clk,RegWrite,Instruct[19:15],Instruct[24:20],Instruct[11:7],Writedata,RD1,RD2);

immediategeneration ImmGen(Instruct[31:0],immediateout);

MUX #(64)ALUsrcMux(RD2,immediateout,ALUSrc,ALUinput2);

ALUControl ALUctrl(Aluop,Instruct[30],Instruct[14:12],Control); //Control is the input of ALU that says which operation

ALU ALUmod(Control,RD1,ALUinput2,ALUOut,Zero);

DataMemory D1(clk,MemWrite,MemRead,ALUOut,RD2,DataOutput);

and PCoffset(andoutput,Branch,Zero);



MUX #(64)MemtoRegMux(ALUOut,DataOutput,MemtoReg,Writedata);

//MUX #(1)M9(1'bx,Instruct[30],Instruct[5],b);

//MUX #(64)M10(RD1,PCoutput,Asel,Mux10output);
//assign d = {{32{Mux10output[31]}},Mux10output[31:0]};
//assign e = {{32{PCPlus4[31]}},PCPlus4[31:0]};

mainController M1(Instruct[6:0],ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch,jump,Aluop);





endmodule
