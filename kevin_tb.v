module kevin_tb;
	parameter delay=5;
	wire out_Gate,out_Data,out_Behavior;
	reg[3:0]in;
	integer i;

	initial begin
		in=0;
		for(i=0;i<16;i=i+1)begin
			#delay
			$display("time=%4d,in=%b,out_Gate=%b,out_Data=%b,out_Behavior=%b",$time,in,out_Gate,out_Data,out_Behavior);
			if((out_Gate|out_Data|out_Behavior)===1'bx||((in==1||in==5||in==6||in==7||in==9||in==10||in==12||in==14)&&(out_Gate&out_Data&out_Behavior)==0)||((in!=1&&in!=5&&in!=6&&in!=7&&in!=9&&in!=10&&in!=12&&in!=14)&&(out_Gate||out_Data||out_Behavior)==1))begin
				$display("WA");
				$finish;
				end
			in=in+1;
		end
		$display("Testbench end");
		$finish;
	end

	kevin_G kg
	(
		.in(in),
		.out(out_Gate)
	);
	kevin_D kd
	(
		.in(in),
		.out(out_Data)
	);
	kevin_B kb
	(
		.in(in),
		.out(out_Behavior)
	);
endmodule	
