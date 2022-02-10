transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/git/DigitalSystems/tasks/Task242-CascadedDFF/Quartus {C:/git/DigitalSystems/tasks/Task242-CascadedDFF/Quartus/pll_main.v}
vlog -vlog01compat -work work +incdir+C:/git/DigitalSystems/tasks/Task242-CascadedDFF/Quartus/db {C:/git/DigitalSystems/tasks/Task242-CascadedDFF/Quartus/db/pll_main_altpll.v}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task242-CascadedDFF {C:/git/DigitalSystems/tasks/Task242-CascadedDFF/d_ff.sv}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task242-CascadedDFF/Quartus {C:/git/DigitalSystems/tasks/Task242-CascadedDFF/Quartus/clk_div_N.sv}

