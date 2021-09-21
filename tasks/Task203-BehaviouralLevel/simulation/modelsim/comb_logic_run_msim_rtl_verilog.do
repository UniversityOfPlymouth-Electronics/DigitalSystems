transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/git/DigitalSystems/tasks/Task203-BehaviouralLevel {C:/git/DigitalSystems/tasks/Task203-BehaviouralLevel/uop_nxor.sv}

