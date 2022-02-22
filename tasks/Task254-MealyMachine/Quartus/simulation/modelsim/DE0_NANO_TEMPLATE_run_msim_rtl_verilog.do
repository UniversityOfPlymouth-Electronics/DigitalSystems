transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/git/DigitalSystems/tasks/Task254-MealyMachine/Quartus {C:/git/DigitalSystems/tasks/Task254-MealyMachine/Quartus/pll_main.v}
vlog -vlog01compat -work work +incdir+C:/git/DigitalSystems/tasks/Task254-MealyMachine/Quartus/db {C:/git/DigitalSystems/tasks/Task254-MealyMachine/Quartus/db/pll_main_altpll.v}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task254-MealyMachine {C:/git/DigitalSystems/tasks/Task254-MealyMachine/fsm_mealy.sv}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task254-MealyMachine/Quartus {C:/git/DigitalSystems/tasks/Task254-MealyMachine/Quartus/led_controller.sv}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task254-MealyMachine/Quartus {C:/git/DigitalSystems/tasks/Task254-MealyMachine/Quartus/clk_div_N.sv}

