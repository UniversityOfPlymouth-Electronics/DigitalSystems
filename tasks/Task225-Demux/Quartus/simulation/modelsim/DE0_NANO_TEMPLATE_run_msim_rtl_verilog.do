transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/git/DigitalSystems/tasks/Task224-Decoders/Quartus {C:/git/DigitalSystems/tasks/Task224-Decoders/Quartus/pll_main.v}
vlog -vlog01compat -work work +incdir+C:/git/DigitalSystems/tasks/Task224-Decoders/Quartus/db {C:/git/DigitalSystems/tasks/Task224-Decoders/Quartus/db/pll_main_altpll.v}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task224-Decoders/Quartus {C:/git/DigitalSystems/tasks/Task224-Decoders/Quartus/clk_div_N.sv}
vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task224-Decoders/Quartus {C:/git/DigitalSystems/tasks/Task224-Decoders/Quartus/decoder_N.sv}

