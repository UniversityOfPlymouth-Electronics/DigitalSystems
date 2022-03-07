transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/git/DigitalSystems/tasks/Task261-BusOutputs/Quartus {C:/git/DigitalSystems/tasks/Task261-BusOutputs/Quartus/pll_main.v}
vlog -vlog01compat -work work +incdir+C:/git/DigitalSystems/tasks/Task261-BusOutputs/Quartus/db {C:/git/DigitalSystems/tasks/Task261-BusOutputs/Quartus/db/pll_main_altpll.v}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task261-BusOutputs {C:/git/DigitalSystems/tasks/Task261-BusOutputs/regN.sv}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task261-BusOutputs/Quartus {C:/git/DigitalSystems/tasks/Task261-BusOutputs/Quartus/clk_div_N.sv}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task261-BusOutputs {C:/git/DigitalSystems/tasks/Task261-BusOutputs/por.sv}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task261-BusOutputs {C:/git/DigitalSystems/tasks/Task261-BusOutputs/oe_selector.sv}

