/*######################################################################
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
///Q=======================================================
//  MODULE Definition
//=======================================================
module CC_MUX21 #(parameter MUX21_SELECTWIDTH=2)(
//////////// OUTPUTS //////////
	CC_MUX21_z_Out,
//////////// INPUTS //////////
	CC_MUX21_dataA_InBUS,
	CC_MUX21_dataB_InBUS,
	CC_MUX21_select_InBUS
	
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	reg CC_MUX21_z_Out;
input 	[MUX21_SELECTWIDTH-1:0] CC_MUX21_select_InBUS;
input 	CC_MUX21_dataA_InBUS;
input 	CC_MUX21_dataB_InBUS;

//=======================================================Q/
///A=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
always @(CC_MUX21_dataA_InBUS or CC_MUX21_dataA_InBUS or CC_MUX21_select_InBUS)
begin
   case( CC_MUX21_select_InBUS )
       0 : CC_MUX21_z_Out = CC_MUX21_dataA_InBUS;
       1 : CC_MUX21_z_Out = CC_MUX21_dataB_InBUS;
       default : CC_MUX21_z_Out = CC_MUX21_dataA_InBUS;       
   endcase
end

endmodule
//=======================================================A/
