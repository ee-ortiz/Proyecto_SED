module SC_regCRASH #(parameter SC_RegCLEAN_OutBUS_InLow, parameter DATA_FIXED_INITREWIN_7 = 8'b00000000, parameter DATA_FIXED_INITREWIN_6 = 8'b00100100, parameter DATA_FIXED_INITREWIN_5 = 8'b00100100, parameter DATA_FIXED_INITREWIN_4 = 8'b00100100, parameter DATA_FIXED_INITREWIN_3 = 8'b00000000, parameter DATA_FIXED_INITREWIN_2 = 8'b00111100, parameter DATA_FIXED_INITREWIN_1 = 8'b01000010, parameter DATA_FIXED_INITREWIN_0 = 8'b00000000;) (
	//////////// OUTPUTS //////////
	SC_RegWIN_OutBUS_InLow,
	//////////// INPUTS //////////
	SC_INITREGWIN__7,
	SC_INITREGWIN__6,
	SC_INITREGWIN__5,
	SC_INITREGWIN__4,
	SC_INITREGWIN__3,
	SC_INITREGWIN__2,
	SC_INITREGWIN__1,
	SC_INITREGWIN__0
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		SC_RegLOSE_OutBUS_InLow;
input	INITREGWIN__7;
input	INITREGWIN__6;
input	INITREGWIN__5;
input	INITREGWIN__4;
input	INITREGWIN__3;
input	INITREGWIN__2;
input	INITREGWIN__1;
input	INITREGWIN__0;

//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_RegCLEAN_InLow == 1'b0)
		SC_RegWIN_OutBus_InLow = 1'b0
		SC_INITREGWIN__7 = DATA_FIXED_INITREWIN_7
		SC_INITREGWIN__6 = DATA_FIXED_INITREWIN_6
		SC_INITREGWIN__5 = DATA_FIXED_INITREWIN_5
		SC_INITREGWIN__4 = DATA_FIXED_INITREWIN_4
		SC_INITREGWIN__3 = DATA_FIXED_INITREWIN_3
		SC_INITREGWIN__2 = DATA_FIXED_INITREWIN_2
		SC_INITREGWIN__1 = DATA_FIXED_INITREWIN_1
		SC_INITREGWIN__0 = DATA_FIXED_INITREWIN_0
	else
		SC_RegWIN_OutBUS_InLow = 1'b1
		
end	
end
endmodule
