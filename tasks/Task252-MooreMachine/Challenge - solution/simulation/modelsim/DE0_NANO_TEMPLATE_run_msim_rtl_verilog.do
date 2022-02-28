transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/git/DigitalSystems/tasks/Task252-MooreMachine/Quartus {C:/git/DigitalSystems/tasks/Task252-MooreMachine/Quartus/pll_main.v}
vlog -vlog01compat -work work +incdir+C:/git/DigitalSystems/tasks/Task252-MooreMachine/Quartus/db {C:/git/DigitalSystems/tasks/Task252-MooreMachine/Quartus/db/pll_main_altpll.v}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task252-MooreMachine/Quartus {C:/git/DigitalSystems/tasks/Task252-MooreMachine/Quartus/clk_div_N.sv}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task252-MooreMachine {C:/git/DigitalSystems/tasks/Task252-MooreMachine/fsm-moore.sv}

