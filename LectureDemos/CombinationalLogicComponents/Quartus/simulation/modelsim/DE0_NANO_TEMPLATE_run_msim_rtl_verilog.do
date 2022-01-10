transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/git/DigitalSystems/LectureDemos/CombinationalLogicComponents/Quartus {C:/git/DigitalSystems/LectureDemos/CombinationalLogicComponents/Quartus/pll_main.v}
vlog -vlog01compat -work work +incdir+C:/git/DigitalSystems/LectureDemos/CombinationalLogicComponents/Quartus/db {C:/git/DigitalSystems/LectureDemos/CombinationalLogicComponents/Quartus/db/pll_main_altpll.v}
vlog -sv -work work +incdir+C:/git/DigitalSystems/LectureDemos/CombinationalLogicComponents/Quartus {C:/git/DigitalSystems/LectureDemos/CombinationalLogicComponents/Quartus/clk_div_N.sv}
vlog -sv -work work +incdir+C:/git/DigitalSystems/LectureDemos/CombinationalLogicComponents/Quartus {C:/git/DigitalSystems/LectureDemos/CombinationalLogicComponents/Quartus/mul.sv}

