transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/git/DigitalSystems/tasks/Task250-Memory/Quartus {C:/git/DigitalSystems/tasks/Task250-Memory/Quartus/pll_main.v}
vlog -vlog01compat -work work +incdir+C:/git/DigitalSystems/tasks/Task250-Memory/Quartus/db {C:/git/DigitalSystems/tasks/Task250-Memory/Quartus/db/pll_main_altpll.v}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task250-Memory {C:/git/DigitalSystems/tasks/Task250-Memory/syncram.sv}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task250-Memory/Quartus {C:/git/DigitalSystems/tasks/Task250-Memory/Quartus/clk_div_N.sv}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task250-Memory {C:/git/DigitalSystems/tasks/Task250-Memory/single_port_rom_async2.sv}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task250-Memory/Quartus {C:/git/DigitalSystems/tasks/Task250-Memory/Quartus/addr_counter.sv}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task250-Memory {C:/git/DigitalSystems/tasks/Task250-Memory/single_port_rom.sv}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task250-Memory {C:/git/DigitalSystems/tasks/Task250-Memory/single_port_rom_async.sv}

