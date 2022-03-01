transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/git/DigitalSystems/tasks/Task260-GenericRegisters/Quartus {C:/git/DigitalSystems/tasks/Task260-GenericRegisters/Quartus/pll_main.v}
vlog -vlog01compat -work work +incdir+C:/git/DigitalSystems/tasks/Task260-GenericRegisters/Quartus/db {C:/git/DigitalSystems/tasks/Task260-GenericRegisters/Quartus/db/pll_main_altpll.v}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task260-GenericRegisters {C:/git/DigitalSystems/tasks/Task260-GenericRegisters/regN.sv}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task260-GenericRegisters {C:/git/DigitalSystems/tasks/Task260-GenericRegisters/addN.sv}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task260-GenericRegisters/Quartus {C:/git/DigitalSystems/tasks/Task260-GenericRegisters/Quartus/clk_div_N.sv}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task260-GenericRegisters {C:/git/DigitalSystems/tasks/Task260-GenericRegisters/por.sv}

