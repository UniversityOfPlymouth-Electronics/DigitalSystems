transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/noutram/git/ELEC241-Staff/sysv/02-CombBuildingBlocks {/home/noutram/git/ELEC241-Staff/sysv/02-CombBuildingBlocks/uop_and2.sv}

