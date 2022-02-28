transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/git/DigitalSystems/tasks/Task256-Timers/Quartus\ -\ solution {C:/git/DigitalSystems/tasks/Task256-Timers/Quartus - solution/pll_main.v}
vlog -vlog01compat -work work +incdir+C:/git/DigitalSystems/tasks/Task256-Timers/Quartus\ -\ solution/db {C:/git/DigitalSystems/tasks/Task256-Timers/Quartus - solution/db/pll_main_altpll.v}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task256-Timers/Quartus\ -\ solution {C:/git/DigitalSystems/tasks/Task256-Timers/Quartus - solution/led_controller.sv}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task256-Timers/Quartus\ -\ solution {C:/git/DigitalSystems/tasks/Task256-Timers/Quartus - solution/clk_div_N.sv}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task256-Timers {C:/git/DigitalSystems/tasks/Task256-Timers/fsm_timer.sv}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task256-Timers {C:/git/DigitalSystems/tasks/Task256-Timers/fsm_moore_soln.sv}

