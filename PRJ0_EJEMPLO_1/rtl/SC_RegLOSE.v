module SC_regCRASH #(parameter SC_RegCRASH_OutBUS_InLow, parameter DATA_FIXED_INITRELOSE_7 = 8'b00000000, parameter DATA_FIXED_INITRELOSE_6 = 8'b00100100, parameter DATA_FIXED_INITRELOSE_5 = 8'b00100100, parameter DATA_FIXED_INITRELOSE_4 = 8'b00100100, parameter DATA_FIXED_INITRELOSE_3 = 8'b00000000, parameter DATA_FIXED_INITRELOSE_2 = 8'b00111100, parameter DATA_FIXED_INITRELOSE_1 = 8'b01000010, parameter DATA_FIXED_INITRELOSE_0 = 8'b00000000;) (
	//////////// OUTPUTS //////////
	SC_RegLOSE_OutBUS_InLow,
	//////////// INPUTS //////////
	SC_INITREGLOSE_7,
	SC_INITREGLOSE_6,
	SC_INITREGLOSE_5,
	SC_INITREGLOSE_4,
	SC_INITREGLOSE_3,
	SC_INITREGLOSE_2,
	SC_INITREGLOSE_1,
	SC_INITREGLOSE_0
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		SC_RegLOSE_OutBUS_InLow;
input	INITREGLOSE_7;
input	INITREGLOSE_6;
input	INITREGLOSE_5;
input	INITREGLOSE_4;
input	INITREGLOSE_3;
input	INITREGLOSE_2;
input	INITREGLOSE_1;
input	INITREGLOSE_0;

//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_RegCRASH_InLow == 1'b0)
		SC_RegLOSE_OutBus_InLow = 1'b0
		SC_INITREGLOSE_7 = DATA_FIXED_INITRELOSE_7
		SC_INITREGLOSE_6 = DATA_FIXED_INITRELOSE_6
		SC_INITREGLOSE_5 = DATA_FIXED_INITRELOSE_5
		SC_INITREGLOSE_4 = DATA_FIXED_INITRELOSE_4
		SC_INITREGLOSE_3 = DATA_FIXED_INITRELOSE_3
		SC_INITREGLOSE_2 = DATA_FIXED_INITRELOSE_2
		SC_INITREGLOSE_1 = DATA_FIXED_INITRELOSE_1
		SC_INITREGLOSE_0 = DATA_FIXED_INITRELOSE_0
	else
		SC_RegLOSE_OutBUS_InLow = 1'b1
		
end	
end
endmodule
