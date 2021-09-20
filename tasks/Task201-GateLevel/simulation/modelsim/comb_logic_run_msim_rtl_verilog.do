transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task201-GateLevel {C:/git/DigitalSystems/tasks/Task201-GateLevel/uop_nxor.sv}

