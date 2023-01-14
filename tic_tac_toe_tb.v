module tic_tac_toe_tb;

	reg clk;
	reg [3:0] in;
	wire [1:0] winner;

	tic_tac_toe uut (.clk(clk), .in(in), .winner(winner));

always #10 clk = ~clk;
	initial begin
		clk = 1;
			  in = 2;//x
		#20; in = 3;//o
		#20; in = 5;//x
		#20; in = 7;//o
		#20; in = 8;//x (barande shod)
		
		#40; in = 2;//x
		#20; in = 5;//o
		#20; in = 3;//x
		#20; in = 4;//o
		#20; in = 9;//x
		#20; in = 6;//o (barande shod)
		
		#40; in = 1;//x
		#20; in = 2;//o
		#20; in = 3;//x
		#20; in = 4;//o
		#20; in = 5;//x
		#20; in = 7;//x
		#20; in = 8;//x
		#20; in = 9;//x

		end
      
endmodule

