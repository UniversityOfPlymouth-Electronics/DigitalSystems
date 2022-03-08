vsim work.Top

add wave -position insertpoint  \
sim:/Top/CLK \
sim:/Top/RESET \
sim:/Top/DOADD \
sim:/Top/A \
sim:/Top/B \
sim:/Top/C \
sim:/Top/D \
sim:/Top/Y

add wave -position insertpoint  \
sim:/Top/b2v_inst2/EN \
sim:/Top/b2v_inst2/S0 \
sim:/Top/b2v_inst2/S1 \
sim:/Top/b2v_inst2/S2 \
sim:/Top/b2v_inst2/state

force -freeze sim:/Top/CLK 1 0, 0 {50 ps} -r 100
force -freeze sim:/Top/RESET 0 0
force -freeze sim:/Top/DOADD 0 0
force -freeze sim:/Top/A 00000001 0
force -freeze sim:/Top/B 00000010 0
force -freeze sim:/Top/C 00000100 0
force -freeze sim:/Top/D 00001000 0

run 5 ps

force -freeze sim:/Top/RESET 1 0
run 100 ps

force -freeze sim:/Top/DOADD 1 0
run 100 ps
force -freeze sim:/Top/DOADD 0 0
run 500 ps



