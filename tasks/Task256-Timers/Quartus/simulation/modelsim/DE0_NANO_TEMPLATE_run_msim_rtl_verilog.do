transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/git/DigitalSystems/tasks/Task256-Timers/Quartus {C:/git/DigitalSystems/tasks/Task256-Timers/Quartus/pll_main.v}
vlog -vlog01compat -work work +incdir+C:/git/DigitalSystems/tasks/Task256-Timers/Quartus/db {C:/git/DigitalSystems/tasks/Task256-Timers/Quartus/db/pll_main_altpll.v}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task256-Timers {C:/git/DigitalSystems/tasks/Task256-Timers/fsm_mealy.sv}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task256-Timers/Quartus {C:/git/DigitalSystems/tasks/Task256-Timers/Quartus/led_controller.sv}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task256-Timers/Quartus {C:/git/DigitalSystems/tasks/Task256-Timers/Quartus/clk_div_N.sv}

