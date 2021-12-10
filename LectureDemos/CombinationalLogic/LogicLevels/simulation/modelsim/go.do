vsim uop_dlatch;

add wave -position insertpoint  A LE OE Y 

force A  1
force LE 0
force OE 0

run 100 ps

force OE 1

run 100 ps

force LE 1

run 100 ps

force LE 0

run 100 ps

force OE 0

run 100 ps