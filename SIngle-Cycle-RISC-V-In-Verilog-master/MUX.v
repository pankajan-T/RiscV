module MUX #(parameter Width = 32)(input [Width-1 : 0] Lin1,Lin2,
 input  Trig,
 output [Width-1 : 0] out);

assign out = (Trig == 1'b0) ? Lin1 : Lin2;


endmodule

