module kevin_G(in,out);
	parameter n=4;	//4 digit input

	input [n-1:0]in;	//input
	output out;

	wire not_0,not_1,not_2,not_3;
	wire r1,r2,r3,r4,r5;

	not n0(not_0,in[0]);
	not n1(not_1,in[1]);
	not n2(not_2,in[2]);
	not n3(not_3,in[3]);

	and g1(r1,not_3,not_1,in[0]);
	and g2(r2,not_2,not_1,in[0]);
	and g3(r3,not_3,in[2],in[1]);
	and g4(r4,in[3],in[1],not_0);
	and g5(r5,in[3],in[2],not_0);

	or g6(out,r1,r2,r3,r4,r5);
endmodule

module kevin_D(in,out);
	parameter n=4;

	input [n-1:0]in;
	output out;

	assign out=(!in[3]&!in[1]&in[0])|(!in[2]&!in[1]&in[0])|(!in[3]&in[2]&in[1])|(in[3]&in[1]&!in[0])|(in[3]&in[2]&!in[0]);
endmodule

module kevin_B(in,out);
	parameter n=4;

	input[n-1:0]in;
	output out;
	reg out;

	always@(*)begin
		case(in)
			1,5,6,7,9,10,12,14:begin
				out=1'b1;
			end
			default:begin
				out=1'b0;
			end
		endcase
	end
endmodule
