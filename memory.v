`timescale 1ps/1ps

module memory(
	input wire clk,
	input wire rst_n,
	input wire we,
	input wire [7:0] in,
	input wire [7:0] addr,
	output wire [7:0] out,

	//debug
	output wire [7:0] debug_memory0,
	output wire [7:0] debug_memory1,
	output wire [7:0] debug_memory2,
	output wire [7:0] debug_memory3,
	output wire [7:0] debug_memory4,
	output wire [7:0] debug_memory5,
	output wire [7:0] debug_memory6,
	output wire [7:0] debug_memory7,
	output wire [7:0] debug_memory8,
	output wire [7:0] debug_memory9,
	output wire [7:0] debug_memory10,
	output wire [7:0] debug_memory11,
	output wire [7:0] debug_memory12,
	output wire [7:0] debug_memory13,
	output wire [7:0] debug_memory14,
	output wire [7:0] debug_memory15,
	output wire [7:0] debug_memory16,
	output wire [7:0] debug_memory17,
	output wire [7:0] debug_memory18,
	output wire [7:0] debug_memory19,
	output wire [7:0] debug_memory20,
	output wire [7:0] debug_memory21,
	output wire [7:0] debug_memory22,
	output wire [7:0] debug_memory23,
	output wire [7:0] debug_memory24,
	output wire [7:0] debug_memory25,
	output wire [7:0] debug_memory26,
	output wire [7:0] debug_memory27,
	output wire [7:0] debug_memory28,
	output wire [7:0] debug_memory29,
	output wire [7:0] debug_memory30,
	output wire [7:0] debug_memory31,
	output wire [7:0] debug_memory32);

	integer i;
	reg [7:0] mem [255:0];

	always @(posedge clk) begin
		if(!rst_n) begin
			for(i=0; i<256; i = i+1) begin
				mem[i] <= 8'h0;
			end

			//init value
			//minimum
			/*
			mem[7]<=8'd4;
			mem[8]<=8'd6;
			mem[20]<=8'd1;
			mem[21]<=8'd2;
			mem[22]<=8'd3;
			mem[29]<=8'd2;
			mem[32]<=8'd7;
			mem[38]<=8'd3;
			mem[42]<=8'd5;
			mem[48]<=8'd4;
			mem[50]<=8'd5;
			mem[52]<=8'd9;
			mem[58]<=8'd1;
			mem[60]<=8'd3;
			mem[63]<=8'd4;
			mem[68]<=8'd6;
			mem[72]<=8'd9;
			*/
			//hard 
			/*
			mem[0]<=8'd8;
			mem[1]<=8'd1;
			mem[6]<=8'd2;
			mem[19]<=8'd7;
			mem[20]<=8'd2;
			mem[22]<=8'd9;
			mem[30]<=8'd8;
			mem[37]<=8'd9;
			mem[42]<=8'd1;
			mem[45]<=8'd7;
			mem[50]<=8'd3;
			mem[53]<=8'd6;
			mem[54]<=8'd4;
			mem[62]<=8'd3;
			mem[63]<=8'd6;
			mem[66]<=8'd3;
			mem[69]<=8'd7;
			mem[70]<=8'd8;
			mem[71]<=8'd5;
			mem[77]<=8'd5;
			mem[79]<=8'd9;
			mem[80]<=8'd1;
			*/
			//easy
			
			mem[3]<=8'd1;
			mem[5]<=8'd4;
			mem[6]<=8'd6;
			mem[7]<=8'd8;
			mem[9]<=8'd3;
			mem[12]<=8'd7;
			mem[16]<=8'd2;
			mem[19]<=8'd7;
			mem[23]<=8'd8;
			mem[28]<=8'd3;
			mem[29]<=8'd1;
			mem[34]<=8'd6;
			mem[36]<=8'd9;
			mem[38]<=8'd2;
			mem[40]<=8'd4;
			mem[44]<=8'd8;
			mem[49]<=8'd2;
			mem[51]<=8'd4;
			mem[55]<=8'd9;
			mem[60]<=8'd5;
			mem[62]<=8'd4;
			mem[66]<=8'd5;
			mem[69]<=8'd2;
			mem[70]<=8'd7;
			mem[72]<=8'd6;
			mem[73]<=8'd2;
            
            //easy2
            /*
            mem[6]=8'd9;
            mem[8]=8'd6;
            mem[11]=8'd1;
            mem[12]=8'd8;
            mem[13]=8'd6;
            mem[14]=8'd9;
            mem[15]=8'd7;
            mem[17]=8'd3;
            mem[18]=8'd9;
            mem[22]=8'd7;
            mem[28]=8'd1;
            mem[30]=8'd5;
            mem[36]=8'd3;
            mem[38]=8'd7;
            mem[40]=8'd8;
            mem[45]=8'd6;
            mem[47]=8'd4;
            mem[48]=8'd9;
            mem[51]=8'd2;
            mem[54]=8'd8;
            mem[59]=8'd3;
            mem[60]=8'd1;
            mem[61]=8'd9;
            mem[62]=8'd4;
            mem[63]=8'd1;
            mem[66]=8'd6;
            mem[68]=8'd8;
            mem[70]=8'd3;
            mem[75]=8'd1;
            mem[76]=8'd9;
            mem[78]=8'd6;
            mem[79]=8'd2;
            mem[80]=8'd8;
            */
			//box id
			mem[162]<=8'd0;
			mem[163]<=8'd0;
			mem[164]<=8'd0;
			mem[165]<=8'd1;
			mem[166]<=8'd1;
			mem[167]<=8'd1;
			mem[168]<=8'd2;
			mem[169]<=8'd2;
			mem[170]<=8'd2;
			mem[171]<=8'd0;
			mem[172]<=8'd0;
			mem[173]<=8'd0;
			mem[174]<=8'd1;
			mem[175]<=8'd1;
			mem[176]<=8'd1;
			mem[177]<=8'd2;
			mem[178]<=8'd2;
			mem[179]<=8'd2;
			mem[180]<=8'd0;
			mem[181]<=8'd0;
			mem[182]<=8'd0;
			mem[183]<=8'd1;
			mem[184]<=8'd1;
			mem[185]<=8'd1;
			mem[186]<=8'd2;
			mem[187]<=8'd2;
			mem[188]<=8'd2;
			mem[189]<=8'd3;
			mem[190]<=8'd3;
			mem[191]<=8'd3;
			mem[192]<=8'd4;
			mem[193]<=8'd4;
			mem[194]<=8'd4;
			mem[195]<=8'd5;
			mem[196]<=8'd5;
			mem[197]<=8'd5;
			mem[198]<=8'd3;
			mem[199]<=8'd3;
			mem[200]<=8'd3;
			mem[201]<=8'd4;
			mem[202]<=8'd4;
			mem[203]<=8'd4;
			mem[204]<=8'd5;
			mem[205]<=8'd5;
			mem[206]<=8'd5;
			mem[207]<=8'd3;
			mem[208]<=8'd3;
			mem[209]<=8'd3;
			mem[210]<=8'd4;
			mem[211]<=8'd4;
			mem[212]<=8'd4;
			mem[213]<=8'd5;
			mem[214]<=8'd5;
			mem[215]<=8'd5;
			mem[216]<=8'd6;
			mem[217]<=8'd6;
			mem[218]<=8'd6;
			mem[219]<=8'd7;
			mem[220]<=8'd7;
			mem[221]<=8'd7;
			mem[222]<=8'd8;
			mem[223]<=8'd8;
			mem[224]<=8'd8;
			mem[225]<=8'd6;
			mem[226]<=8'd6;
			mem[227]<=8'd6;
			mem[228]<=8'd7;
			mem[229]<=8'd7;
			mem[230]<=8'd7;
			mem[231]<=8'd8;
			mem[232]<=8'd8;
			mem[233]<=8'd8;
			mem[234]<=8'd6;
			mem[235]<=8'd6;
			mem[236]<=8'd6;
			mem[237]<=8'd7;
			mem[238]<=8'd7;
			mem[239]<=8'd7;
			mem[240]<=8'd8;
			mem[241]<=8'd8;
			mem[242]<=8'd8;
			
			//led pattern
			mem[150]<=8'b1100_0000; //0
			mem[151]<=8'b1111_1001; //1
			mem[152]<=8'b1010_0100; //2
			mem[153]<=8'b1011_0000; //3
			mem[154]<=8'b1001_1001; //4
			mem[155]<=8'b1001_0010; //5
			mem[156]<=8'b1000_0010; //6
			mem[157]<=8'b1101_1000; //7
			mem[158]<=8'b1000_0000; //8
			mem[159]<=8'b1001_0000; //9

		end else begin
			if(we) begin
				mem[addr] <= in;
			end
		end
	end

	assign out = mem[addr];

	assign debug_memory0 = mem[0];
	assign debug_memory1 = mem[1];
	assign debug_memory2 = mem[2];
	assign debug_memory3 = mem[3];
	assign debug_memory4 = mem[4];
	assign debug_memory5 = mem[5];
	assign debug_memory6 = mem[6];
	assign debug_memory7 = mem[7];
	assign debug_memory8 = mem[8];
	assign debug_memory9 = mem[9];
	assign debug_memory10 = mem[10];
	assign debug_memory11 = mem[11];
	assign debug_memory12 = mem[12];
	assign debug_memory13 = mem[13];
	assign debug_memory14 = mem[14];
	assign debug_memory15 = mem[15];
	assign debug_memory16 = mem[16];
	assign debug_memory17 = mem[17];
	assign debug_memory18 = mem[18];
	assign debug_memory19 = mem[19];
	assign debug_memory20 = mem[20];
	assign debug_memory21 = mem[21];
	assign debug_memory22 = mem[22];
	assign debug_memory23 = mem[23];
	assign debug_memory24 = mem[24];
	assign debug_memory25 = mem[25];
	assign debug_memory26 = mem[26];
	assign debug_memory27 = mem[27];
	assign debug_memory28 = mem[28];
	assign debug_memory29 = mem[29];
	assign debug_memory30 = mem[30];
	assign debug_memory31 = mem[31];
	assign debug_memory32 = mem[32];

endmodule
