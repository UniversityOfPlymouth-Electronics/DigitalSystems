transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task202-DataFlowLevel {C:/git/DigitalSystems/tasks/Task202-DataFlowLevel/uop_nxor.sv}

