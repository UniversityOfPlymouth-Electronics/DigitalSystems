transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -sv -work work +incdir+. {comb_logic.svo}

vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task209-TestBench {C:/git/DigitalSystems/tasks/Task209-TestBench/uop_nxor_tb.sv}

vsim -t 1ps -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  uop_nxor_tb

add wave *
view structure
view signals
run -all
