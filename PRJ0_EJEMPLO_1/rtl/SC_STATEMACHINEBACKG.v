///*######################################################################
//#	G0B1T: HDL EXAMPLES. 2018.
//######################################################################
//# Copyright (C) 2018. F.E.Segura-Quijano (FES) fsegura@uniandes.edu.co
//# 
//# This program is free software: you can redistribute it and/or modify
//# it under the terms of the GNU General Public License as published by
//# the Free Software Foundation, version 3 of the License.
//#
//# This program is distributed in the hope that it will be useful,
//# but WITHOUT ANY WARRANTY; without even the implied warranty of
//# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//# GNU General Public License for more details.
//#
//# You should have received a copy of the GNU General Public License
//# along with this program.  If not, see <http://www.gnu.org/licenses/>
//####################################################################*/
//=======================================================
//  MODULE Definition
//=======================================================
module SC_STATEMACHINEBACKG (
	//////////// OUTPUTS //////////
	SC_STATEMACHINEBACKG_clear_OutLow,
	SC_STATEMACHINEBACKG_load_OutLow,
//	SC_STATEMACHINEBACKG_upcount_out,
	SC_STATEMACHINEBACKG_lose_outLow,
	SC_STATEMACHINEBACKG_win_outLow,
	SC_STATEMACHINEBACKG_nivel,
	//////////// INPUTS //////////
	SC_STATEMACHINEBACKG_CLOCK_50,
	SC_STATEMACHINEBACKG_RESET_InHigh,
	SC_STATEMACHINEBACKG_startButton_InLow,
//	SC_STATEMACHINEBACKG_T0_InLow,
	SC_STATEMACHINEBACKG_crash_InLow,
	SC_STATEMACHINEBACKG_lose_inLow,
	SC_STATEMACHINEBACKG_win_inLow
);	
//=======================================================
//  PARAMETER declarations
//=======================================================
// states declaration
localparam STATE_RESET_0									= 0;
localparam STATE_START_0									= 1;
localparam STATE_CHECK_0									= 2;
localparam STATE_COUNT_0									= 3;
localparam STATE_LOSE_0										= 4;
localparam STATE_WIN_0										= 5;
localparam STATE_LEVEL_1									= 6;
localparam STATE_LEVEL_2									= 7;
localparam STATE_LEVEL_3									= 8;
//=======================================================
//  PORT declarations
//=======================================================
output reg		SC_STATEMACHINEBACKG_clear_OutLow;
output reg		SC_STATEMACHINEBACKG_load_OutLow;
//output reg 		SC_STATEMACHINEBACKG_upcount_out;
output reg     SC_STATEMACHINEBACKG_lose_outLow;
output reg		SC_STATEMACHINEBACKG_win_outLow;
output reg     [1:0]SC_STATEMACHINEBACKG_nivel;
input			SC_STATEMACHINEBACKG_CLOCK_50;
input 		SC_STATEMACHINEBACKG_RESET_InHigh;
input			SC_STATEMACHINEBACKG_startButton_InLow;
//input			SC_STATEMACHINEBACKG_T0_InLow;
input 		SC_STATEMACHINEBACKG_crash_InLow;
input			SC_STATEMACHINEBACKG_lose_inLow;
input			SC_STATEMACHINEBACKG_win_inLow;
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [3:0] STATE_Register;
reg [3:0] STATE_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
// NEXT STATE LOGIC : COMBINATIONAL
always @(*)
begin
	case (STATE_Register)
		STATE_RESET_0: STATE_Signal = STATE_START_0;
		STATE_START_0: STATE_Signal = STATE_CHECK_0;
		
		
		STATE_CHECK_0: if (SC_STATEMACHINEBACKG_startButton_InLow == 1'b0) STATE_Signal = STATE_LEVEL_1;
						else STATE_Signal = STATE_CHECK_0;
						
						
		STATE_LEVEL_1:	if (SC_STATEMACHINEBACKG_lose_inLow == 1'b0) STATE_Signal = STATE_LOSE_0;
						else if (SC_STATEMACHINEBACKG_win_inLow == 1'b0) STATE_Signal = STATE_LEVEL_2;
						else STATE_Signal = STATE_LEVEL_1;
							
		STATE_LEVEL_2:	if (SC_STATEMACHINEBACKG_lose_inLow == 1'b0) STATE_Signal = STATE_LOSE_0;
						else if (SC_STATEMACHINEBACKG_win_inLow == 1'b0) STATE_Signal = STATE_LEVEL_3;
						else STATE_Signal = STATE_LEVEL_2;
						
		STATE_LEVEL_3:	if (SC_STATEMACHINEBACKG_lose_inLow == 1'b0) STATE_Signal = STATE_LOSE_0;
						else if (SC_STATEMACHINEBACKG_win_inLow == 1'b0) STATE_Signal = STATE_WIN_0;
						else STATE_Signal = STATE_LEVEL_3;
		
		STATE_LOSE_0: if (SC_STATEMACHINEBACKG_startButton_InLow == 1'b0) STATE_Signal = STATE_START_0;
						else STATE_Signal = STATE_LOSE_0;
//Revisar jugador contador
 		STATE_WIN_0: if (SC_STATEMACHINEBACKG_startButton_InLow == 1'b0) STATE_Signal = STATE_START_0;
						else STATE_Signal = STATE_WIN_0;

		default : 		STATE_Signal = STATE_CHECK_0;
	endcase
end
// STATE REGISTER : SEQUENTIAL
always @ ( posedge SC_STATEMACHINEBACKG_CLOCK_50 , posedge SC_STATEMACHINEBACKG_RESET_InHigh)
begin
	if (SC_STATEMACHINEBACKG_RESET_InHigh == 1'b1)
		STATE_Register <= STATE_RESET_0;
	else
		STATE_Register <= STATE_Signal;
end
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL
always @ (*)
begin
	case (STATE_Register)
//=========================================================
// STATE_RESET
//=========================================================
	STATE_RESET_0 :	
		begin
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1;
//			SC_STATEMACHINEBACKG_upcount_out = 1'b1;
			SC_STATEMACHINEBACKG_win_outLow = 1'b1;
			SC_STATEMACHINEBACKG_lose_outLow = 1'b1;
			SC_STATEMACHINEBACKG_nivel = 2'b00;
		end
//=========================================================
// STATE_START
//=========================================================
	STATE_START_0 :	
		begin
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b0;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1;
//			SC_STATEMACHINEBACKG_upcount_out = 1'b1;
			SC_STATEMACHINEBACKG_win_outLow = 1'b1;
			SC_STATEMACHINEBACKG_lose_outLow = 1'b1;
			SC_STATEMACHINEBACKG_nivel = 2'b00;
		end
//=========================================================
// STATE_CHECK
//=========================================================
	STATE_CHECK_0 :
		begin
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1;
//			SC_STATEMACHINEBACKG_upcount_out = 1'b1;
			SC_STATEMACHINEBACKG_win_outLow = 1'b1;
			SC_STATEMACHINEBACKG_lose_outLow = 1'b1;
			SC_STATEMACHINEBACKG_nivel = 2'b00;
		end
//=========================================================
// STATE_LEVEL_1
//=========================================================
	STATE_LEVEL_1 :	
		begin
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1;
//			SC_STATEMACHINEBACKG_upcount_out = 1'b1;
			SC_STATEMACHINEBACKG_win_outLow = 1'b1;
			SC_STATEMACHINEBACKG_lose_outLow = 1'b1;
			SC_STATEMACHINEBACKG_nivel = 2'b01;
		end

//=========================================================
// STATE_LEVEL_2
//=========================================================
	STATE_LEVEL_2 :	
		begin
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1;
//			SC_STATEMACHINEBACKG_upcount_out = 1'b1;
			SC_STATEMACHINEBACKG_win_outLow = 1'b1;
			SC_STATEMACHINEBACKG_lose_outLow = 1'b1;
			SC_STATEMACHINEBACKG_nivel = 2'b10;
		end		
//=========================================================
// STATE_LEVEL_3
//=========================================================
	STATE_LEVEL_3 :	
		begin
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1; 
//			SC_STATEMACHINEBACKG_upcount_out = 1'b1;
			SC_STATEMACHINEBACKG_win_outLow = 1'b1;
			SC_STATEMACHINEBACKG_lose_outLow = 1'b1;
			SC_STATEMACHINEBACKG_nivel = 2'b11;
		end
//=========================================================
// STATE_COUNT_0
//=========================================================
	STATE_COUNT_0 :	
		begin
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1; 
//			SC_STATEMACHINEBACKG_upcount_out = 1'b1;
			SC_STATEMACHINEBACKG_win_outLow = 1'b1;
			SC_STATEMACHINEBACKG_lose_outLow = 1'b1;
			SC_STATEMACHINEBACKG_nivel = 2'b00;
		end
//=========================================================
// STATE_LOSE_0
//=========================================================
	STATE_LOSE_0 :	
		begin
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1;
//			SC_STATEMACHINEBACKG_upcount_out = 1'b1;
			SC_STATEMACHINEBACKG_win_outLow = 1'b1;
			SC_STATEMACHINEBACKG_lose_outLow = 1'b0;
			SC_STATEMACHINEBACKG_nivel = 2'b00;
		end
//=========================================================
// STATE_WIN_0
//=========================================================
	STATE_WIN_0 :	
		begin
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1;
//			SC_STATEMACHINEBACKG_upcount_out = 1'b1;
			SC_STATEMACHINEBACKG_win_outLow = 1'b0;
			SC_STATEMACHINEBACKG_lose_outLow = 1'b1;
			SC_STATEMACHINEBACKG_nivel = 2'b00;
		end
//=========================================================
// DEFAULT
//=========================================================
	default :
		begin
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1; 
//			SC_STATEMACHINEBACKG_upcount_out = 1'b1;
			SC_STATEMACHINEBACKG_win_outLow = 1'b1;
			SC_STATEMACHINEBACKG_lose_outLow = 1'b1;
			SC_STATEMACHINEBACKG_nivel = 2'b00;
		end
	endcase
end
endmodule
