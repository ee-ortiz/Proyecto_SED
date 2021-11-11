transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+Z:/Users/ESTEBAN/Downloads/New\ folder/PRJ0_EJEMPLO_2/rtl {Z:/Users/ESTEBAN/Downloads/New folder/PRJ0_EJEMPLO_2/rtl/CC_MUX21.v}
vlog -vlog01compat -work work +incdir+Z:/Users/ESTEBAN/Downloads/New\ folder/PRJ0_EJEMPLO_2/rtl {Z:/Users/ESTEBAN/Downloads/New folder/PRJ0_EJEMPLO_2/rtl/SC_STATEMACHINEBACKG.v}
vlog -vlog01compat -work work +incdir+Z:/Users/ESTEBAN/Downloads/New\ folder/PRJ0_EJEMPLO_2/rtl {Z:/Users/ESTEBAN/Downloads/New folder/PRJ0_EJEMPLO_2/rtl/SC_RegBACKGTYPE.v}
vlog -vlog01compat -work work +incdir+Z:/Users/ESTEBAN/Downloads/New\ folder/PRJ0_EJEMPLO_2/rtl {Z:/Users/ESTEBAN/Downloads/New folder/PRJ0_EJEMPLO_2/rtl/SC_STATEMACHINEPOINT.v}
vlog -vlog01compat -work work +incdir+Z:/Users/ESTEBAN/Downloads/New\ folder/PRJ0_EJEMPLO_2/rtl {Z:/Users/ESTEBAN/Downloads/New folder/PRJ0_EJEMPLO_2/rtl/SC_RegPOINTTYPE.v}
vlog -vlog01compat -work work +incdir+Z:/Users/ESTEBAN/Downloads/New\ folder/PRJ0_EJEMPLO_2/rtl {Z:/Users/ESTEBAN/Downloads/New folder/PRJ0_EJEMPLO_2/rtl/CC_BOTTOMSIDECOMPARATOR.v}
vlog -vlog01compat -work work +incdir+Z:/Users/ESTEBAN/Downloads/New\ folder/PRJ0_EJEMPLO_2/rtl {Z:/Users/ESTEBAN/Downloads/New folder/PRJ0_EJEMPLO_2/rtl/SC_upCOUNTER.v}
vlog -vlog01compat -work work +incdir+Z:/Users/ESTEBAN/Downloads/New\ folder/PRJ0_EJEMPLO_2/rtl {Z:/Users/ESTEBAN/Downloads/New folder/PRJ0_EJEMPLO_2/rtl/CC_SEVENSEG1.v}
vlog -vlog01compat -work work +incdir+Z:/Users/ESTEBAN/Downloads/New\ folder/PRJ0_EJEMPLO_2/rtl {Z:/Users/ESTEBAN/Downloads/New folder/PRJ0_EJEMPLO_2/rtl/CC_BIN2BCD1.v}
vlog -vlog01compat -work work +incdir+Z:/Users/ESTEBAN/Downloads/New\ folder/PRJ0_EJEMPLO_2/rtl {Z:/Users/ESTEBAN/Downloads/New folder/PRJ0_EJEMPLO_2/rtl/SC_upSPEEDCOUNTER.v}
vlog -vlog01compat -work work +incdir+Z:/Users/ESTEBAN/Downloads/New\ folder/PRJ0_EJEMPLO_2/rtl {Z:/Users/ESTEBAN/Downloads/New folder/PRJ0_EJEMPLO_2/rtl/CC_SPEEDCOMPARATOR.v}
vlog -vlog01compat -work work +incdir+Z:/Users/ESTEBAN/Downloads/New\ folder/PRJ0_EJEMPLO_2/rtl {Z:/Users/ESTEBAN/Downloads/New folder/PRJ0_EJEMPLO_2/rtl/shift_reg_start_done.v}
vlog -vlog01compat -work work +incdir+Z:/Users/ESTEBAN/Downloads/New\ folder/PRJ0_EJEMPLO_2/rtl {Z:/Users/ESTEBAN/Downloads/New folder/PRJ0_EJEMPLO_2/rtl/max7219_ctrl.v}
vlog -vlog01compat -work work +incdir+Z:/Users/ESTEBAN/Downloads/New\ folder/PRJ0_EJEMPLO_2/rtl {Z:/Users/ESTEBAN/Downloads/New folder/PRJ0_EJEMPLO_2/rtl/SC_DEBOUNCE1.v}
vlog -vlog01compat -work work +incdir+Z:/Users/ESTEBAN/Downloads/New\ folder/PRJ0_EJEMPLO_2 {Z:/Users/ESTEBAN/Downloads/New folder/PRJ0_EJEMPLO_2/BB_SYSTEM.v}

vlog -vlog01compat -work work +incdir+Z:/Users/ESTEBAN/Downloads/New\ folder/PRJ0_EJEMPLO_2/simulation/modelsim {Z:/Users/ESTEBAN/Downloads/New folder/PRJ0_EJEMPLO_2/simulation/modelsim/TB_SYSTEM.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  TB_SYSTEM

add wave *
view structure
view signals
run -all
