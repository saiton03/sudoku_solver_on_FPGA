`timescale 1ps/1ps

module imem(input wire [7:0] pc, output reg [15:0] op);

	`include "def.h"

	always @(*) begin
		case (pc)
			//makesearchlist res[0]=0;
			0 : op = {LI,8'd81,4'd1}; //res[1]=81;
			1 : op = {LI,8'd81,4'd15}; //res[15]=81;
			2 : op = {LOAD,4'd2,4'd0,4'd14}; //res[14]=mem[res[2];
			3 : op = {CMPI,4'd14,8'd0}; //if(res[14]==0)
			4 : op = {JNZ,8'd9,4'd0}; //goto true
			5 : op = {CMPI,4'd2,8'd80}; //if(res[2]==80)
			6 : op = {JNZ,8'd12,4'd0}; //break;
			7 : op = {ADDI,4'd2,8'd1}; //res[2]++;
			8 : op = {JMP,8'd2,4'd0}; //goto makesearchlist
			9 : op = {STORE,4'd1,4'd2,4'h0}; //mem[res[1]]=res[2];
			10 : op = {ADDI,4'd1,8'd1}; //res[1]++;
			11 : op = {JMP,8'd5,4'd0}; //end if
			12 : op = {LI,8'd255,4'd13}; //res[13]=255;
			13 : op = {STORE,4'd1,4'd13,4'h0}; //mem[res[1]]=res[13](=255)
			14 : op = {JMP,8'd80,4'd0}; //goto main

			//is_put
			21 : op = {LI,8'd0,4'd8}; //res[8]=0; don't change
			22 : op = {ADD,4'd8,4'd1,4'd12}; //res[12]=res[8](=0)+res[1]
			23 : op = {LI,8'd0,4'd4}; //res[4]=0
			//loop devide
			24 : op = {CMP,4'd12,4'd4,4'h0}; //if(res[12]==res[4]) (while)
			25 : op = {JNZ,8'd34,4'd0}; //break
			26 : op = {ADDI,4'd4,8'd1}; //res[4]++;
			27 : op = {CMPI,4'd4,8'd9}; //if(res[4]==9)
			28 : op = {JNZ,8'd30,4'd0}; //goto true
			29 : op = {JMP,8'd24,4'd0}; //next
			30 : op = {LI,8'd0,4'd4}; //res[4]=0;
			31 : op = {ADDI,4'd3,8'd1}; //res[3]++;
			32 : op = {SUBI,4'd12,8'd9}; //res[12]-=9
			33 : op = {JMP,8'd24,4'd0}; //endif next
			//end loop
			34 : op = {SUB,4'd1,4'd4,4'd12}; //res[12]=res[1]-res[4];
			35 : op = {LI,8'd0,4'd11}; //res[11]=0;
			//loop row_check
			36 : op = {ADD,4'd12,4'd11,4'd10}; //res[10]=res[12]+res[11];
			37 : op = {LOAD,4'd10,4'd0,4'd10}; //res[10]=mem[res10];
			38 : op = {CMP,4'd10,4'd2,4'h0}; //if(res[10]==res[2])
			39 : op = {JNZ,8'd92,4'd0}; //goto putfalse
			40 : op = {ADDI,4'd11,8'd1}; //res[11]++
			41 : op = {CMPI,4'd11,8'd9}; //if(res[11]==9)
			42 : op = {JNZ,8'd50,4'd0}; //break;
			43 : op = {JMP,8'd36,4'd0}; //next (goto loop row_check)

			50 : op = {ADD,4'd8,4'd4,4'd13}; //res[13]=res[8](=0)+res[4];
			51 : op = {LI,8'd0,4'd12}; //res[12]=0;
			//loop column_check
			52 : op = {LOAD,4'd13,4'd0,4'd11}; //res[11]=mem[res[13]];
			53 : op = {CMP,4'd11,4'd2,4'h0}; //if(res[11]==res[2])
			54 : op = {JNZ,8'd92,4'd0}; //goto putfalse
			55 : op = {ADDI,4'd13,8'd9}; //res[13]+=9;
			56 : op = {ADDI,4'd12,8'd1}; //res[12]++
			57 : op = {CMPI,4'd12,8'd9}; //if(res[12]==9)
			58 : op = {JNZ,8'd60,4'd0}; //break;
			59 : op = {JMP,8'd52,4'd0}; //next

			60 : op = {LI,8'd162,4'd13}; //res[13]=162;
			61 : op = {ADD,4'd13,4'd1,4'd5}; //res[5]=res[12]+res[13];
			62 : op = {LOAD,4'd5,4'd0,4'd5}; //res[5]=mem[res[5]];
			63 : op = {LI,8'd0,4'd12}; //res[12]=0;
			//loop box_check
			64 : op = {ADD,4'd12,4'd13,4'd11}; //res[11]=res[12]+res[13]
			65 : op = {LOAD,4'd11,4'd0,4'd11}; //res[11]=mem[res[11]];
			66 : op = {CMP,4'd11,4'd5,4'h0}; //if(res[11]==res[5])
			67 : op = {JNZ,8'd72,4'd0}; //goto true
			68 : op = {ADDI,4'd12,8'd1}; //res[12]++;
			69 : op = {CMPI,4'd12,8'd81}; //if(res[12]==81)
			70 : op = {JNZ,8'd94,4'd0}; //goto put true
			71 : op = {JMP,8'd64,4'd4}; //next
			72 : op = {LOAD,4'd12,4'd0,4'd10}; //res[10]=mem[res[12]];
			73 : op = {CMP,4'd10,4'd2,4'h0}; //if(res[10]==res[2])
			74 : op = {JNZ,8'd92,4'd0}; //goto putfalse
			75 : op = {JMP,8'd68,4'd0}; //end if

			//main
			80 : op = {LOAD,4'd15,4'd0,4'd1}; //res[1]=mem[res[15]];
			81 : op = {CMPI,4'd1,8'd255}; //if(res[1]==0)
			82 : op = {JNZ,8'd99,4'd0}; //goto print result
			83 : op = {LOAD,4'd1,4'd0,4'd2}; //res[2]=mem[res[1]];
			84 : op = {ADDI,4'd2,8'd1}; //res[2]++;
			//mainloop
			85 : op = {CMPI,4'd2,8'd10}; //if(res[2]==10)
			86 : op = {JNZ,8'd88,4'd0}; //goto true
			87 : op = {JMP,8'd21,4'd0}; //goto is_put
			88 : op = {LI,8'd0,4'd14}; //res[14]=0;
			89 : op = {STORE,4'd1,4'd14,4'h0}; //mem[res[1]]=res[14](=0);
			90 : op = {SUBI,4'd15,8'd1}; //res[15]--;
			91 : op = {JMP,8'd80,4'd0}; //goto main
			//putfalse
			92 : op = {ADDI,4'd2,8'd1}; //res[2]++;
			93 : op = {JMP,8'd85,4'd0}; //goto mainloop
			//puttrue
			94 : op = {STORE,4'd1,4'd2,4'h0}; //mem[res[1]]=res[2];
			95 : op = {ADDI,4'd15,8'd1}; //res[15]++;
			96 : op = {JMP,8'd80,4'd0}; //goto main

			//print_result
			//100 : op = {JMP,8'd100,4'd0};
			99 : op = {LI,8'hfb,4'd8}; //res[8]=0xfb;(start mem of io signal)
			100 : op = {LI,8'd0,4'd12}; //res[12]=0; (index)
			101 : op = {LI,8'd0,4'd10}; //res[10]=0; (row)
			102 : op = {LI,8'd0,4'd11}; //res[11]=0; (column)
			103 : op = {JMP,8'd160,4'd0}; //goto show
			//start print_loop
			104 : op = {LOAD,4'd8,4'h0,4'd2}; //res[2]=mem[res[8](=251)]
			
			105 : op = {CMPI,4'd2,8'b00000000}; //if (buttonnone)
			106 : op = {JNZ,8'd117,4'd0};  //goto buttonnone
			107 : op = {CMPI,4'd9,8'd1}; //if(res[9]==1)
			108 : op = {JNZ,8'd104,4'd0}; //goto printloop
			109 : op = {CMPI,4'd2,8'b00000010};
			110 : op = {JNZ,8'd119,4'd0};  //goto buttonleft
			111 : op = {CMPI,4'd2,8'b00000100};
			112 : op = {JNZ,8'd125,4'd0};  //goto buttonright
			113 : op = {CMPI,4'd2,8'b00010000}; //?
			114 : op = {JNZ,8'd135,4'd0};  //goto buttonup
			115 : op = {CMPI,4'd2,8'b00001000}; //?
			116 : op = {JNZ,8'd145,4'd0};  //goto buttondown
			/*
			105 : op = {CMPI,4'd9,8'd1}; //if(res[9]==1)
			106 : op = {JNZ,8'd115,4'd0}; //goto buttonnone
			107 : op = {CMPI,4'd2,8'b00000010};
			108 : op = {JNZ,8'd117,4'd0};  //goto buttonleft
			109 : op = {CMPI,4'd2,8'b00000100};
			110 : op = {JNZ,8'd125,4'd0};  //goto buttonright
			111 : op = {CMPI,4'd2,8'b00010000}; //?
			112 : op = {JNZ,8'd135,4'd0};  //goto buttonup
			113 : op = {CMPI,4'd2,8'b00001000}; //?
			114 : op = {JNZ,8'd145,4'd0};  //goto buttondown
			107 : op = {CMPI,4'd2,8'b00000000};
			108 : op = {JNZ,8'd115,4'd0};  //goto buttonnone
			109 : op = {JMP,8'd104,4'd0}; //goto print_loop
            */
            
			//buttunnone
			117 : op = {LI,8'd0,4'd9}; //res[9]=0;
			118 : op = {JMP,8'd104,4'd0}; //goto print_loop;
			//buttonleft
			119 : op = {CMPI,4'd11,8'd0}; //if(res[11]==0)
			120 : op = {JNZ,8'd104,4'h0}; //goto print_loop
			121 : op = {SUBI,4'd11,8'd1}; //res[11]--;
			122 : op = {SUBI,4'd12,8'd1}; //res[12]--;
			123 : op = {LI,8'd1,4'd9}; //res[9]=1;
			124 : op = {JMP,8'd160,4'd0}; //goto change_num

			//buttonright
			125 : op = {CMPI,4'd11,8'd8}; //if(res[11]==8)
			126 : op = {JNZ,8'd104,4'h0}; //goto print_loop
			127 : op = {ADDI,4'd11,8'd1}; //res[11]++;
			128 : op = {ADDI,4'd12,8'd1}; //res[12]++;
			129 : op = {LI,8'd1,4'd9}; //res[9]=1;
			130 : op = {JMP,8'd160,4'd0}; //goto change_num

			//buttonup
			135 : op = {CMPI,4'd10,8'd0}; //if(res[10]==0)
			136 : op = {JNZ,8'd104,4'h0}; //goto print_loop
			137 : op = {SUBI,4'd10,8'd1}; //res[10]--;
			138 : op = {SUBI,4'd12,8'd9}; //res[12]-=9;
			139 : op = {LI,8'd1,4'd9}; //res[9]=1;
			140 : op = {JMP,8'd160,4'd0}; //goto change_num

			//buttondown
			145 : op = {CMPI,4'd10,8'd8}; //if(res[10]==8)
			146 : op = {JNZ,8'd104,4'h0}; //goto print_loop
			147 : op = {ADDI,4'd10,8'd1}; //res[10]++;
			148 : op = {ADDI,4'd12,8'd9}; //res[12]+=9;
			149 : op = {LI,8'd1,4'd9}; //res[9]=1;
			150 : op = {JMP,8'd160,4'd0}; //goto change_num

			//chang_num(show)
			160 : op = {LI,8'd150,4'd1}; //res[1]=150;
			161 : op = {ADD,4'd1,4'd10,4'd3}; //res[3]=res[1](=150)+res[10](row)
			162 : op = {LOAD,4'd3,4'h0,4'd3}; //res[3]=mem[res[3]]
			163 : op = {STORE,4'd8,4'd3,4'd4}; //mem[res[8]+4]=res[3] rowoutput
			164 : op = {ADD,4'd1,4'd11,4'd3}; //res[3]=res[1]+res[11](column)
			165 : op = {LOAD,4'd3,4'h0,4'd3}; //res[3]=mem[res[3]];
			166 : op = {STORE,4'd8,4'd3,4'd3}; //mem[res[8]]=res[3]; columnoutput
			167 : op = {LOAD,4'd12,4'h0,4'd13}; //res[13] = mem[res[12]}; getvalue
			168 : op = {ADD,4'd1,4'd13,4'd3}; //res[3]=res[1]+res[13];
			169 : op = {LOAD,4'd3,4'd0,4'd3}; //res[3]=mem[res[3]];
			170 : op = {STORE,4'd8,4'd3,4'd1}; //mem[res[8]+1]=res[3];
			171 : op = {LI,8'hff,4'd3}; //res[3]=0xff;
			172 : op = {STORE,4'd8,4'd3,4'd2}; //mem[res[8]+2]=res[3](=0xff);
			173 : op = {JMP,8'd104,4'd0}; //goto print_loop

			default: op = 16'bx;
		endcase
	end

endmodule
