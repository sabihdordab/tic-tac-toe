module tic_tac_toe(clk,in,winner);
input clk;
input [3:0] in;
output reg [1:0] winner;
//////////////////////////////////////////////////////////////////////////////////////////////////////////
reg [1:0] temp = 2'b01;
reg [1:0] memory [9:1]; // 9 khane 2 biti
parameter init = 2'b00 , x_turn = 2'b01 , o_turn = 2'b10;
reg [1:0] state = init;
//////////////////////////////////////////////////////////////////////////////////////////////////////////
always@(posedge clk)
begin
case (state)
//////////////////////////////////////////////////////////////////////////////////////////////////////////
init : begin
{memory[1] , memory[2] , memory[3] , memory[4] , memory[5] , memory[6] , memory[7] , memory[8] , memory[9]} =
{2'b00 	  , 2'b00 	  , 2'b00 	  , 2'b00 	  , 2'b00 	  , 2'b00 	  , 2'b00 	  , 2'b00 	  , 2'b00};
state = temp;
winner = 2'b00;
{memory[in]} = {temp};
end
//////////////////////////////////////////////////////////////////////////////////////////////////////////
x_turn : begin
if (memory[in] == 2'b00) begin
{memory[in]} = {2'b10};
end
if ({memory[1],memory[2],memory[3],memory[4],memory[5],memory[6],memory[7],memory[8],memory[9]} !==
{2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00,2'b00}) begin
state = init;
winner = 2'b00;
end
if ({memory[1] , memory[2] , memory[3]} == {2'b01 , 2'b01 , 2'b01} ||
{memory[4] , memory[5] , memory[6]} == {2'b01 , 2'b01 , 2'b01} ||
{memory[7] , memory[8] , memory[9]} == {2'b01 , 2'b01 , 2'b01} ||
{memory[1] , memory[4] , memory[7]} == {2'b01 , 2'b01 , 2'b01} ||
{memory[2] , memory[5] , memory[8]} == {2'b01 , 2'b01 , 2'b01} ||
{memory[3] , memory[6] , memory[9]} == {2'b01 , 2'b01 , 2'b01} ||
{memory[1] , memory[5] , memory[9]} == {2'b01 , 2'b01 , 2'b01}) begin
state = init;
temp = x_turn;
winner = 2'b01;
end
else begin
winner = 2'b00;
state = o_turn;
end
end
//////////////////////////////////////////////////////////////////////////////////////////////////////////
o_turn : begin
if (memory[in] == 2'b00) begin
{memory[in]} = {2'b01};
end
if ({memory[1],memory[2],memory[3],memory[4],memory[5],memory[6],memory[7],memory[8],memory[9]} !==
{2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00, 2'b00,2'b00}) begin
state = init;
winner = 2'b00;
end
if ({memory[1] , memory[2] , memory[3]} == {2'b10 , 2'b10 , 2'b10} ||
{memory[4] , memory[5] , memory[6]} == {2'b10 , 2'b10 , 2'b10} ||
{memory[7] , memory[8] , memory[9]} == {2'b10 , 2'b10 , 2'b10} ||
{memory[1] , memory[4] , memory[7]} == {2'b10 , 2'b10 , 2'b10} ||
{memory[2] , memory[5] , memory[8]} == {2'b10 , 2'b10 , 2'b10} ||
{memory[3] , memory[6] , memory[9]} == {2'b10 , 2'b10 , 2'b10} ||
{memory[1] , memory[5] , memory[9]} == {2'b10 , 2'b10 , 2'b10}) begin
state = init;
temp = o_turn;
winner = 2'b10;
end
else begin
winner = 2'b00;
state = x_turn;
end
end
//////////////////////////////////////////////////////////////////////////////////////////////////////////
endcase
end
endmodule
