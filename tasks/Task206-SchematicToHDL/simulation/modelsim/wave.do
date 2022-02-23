onerror {resume}
quietly virtual signal -install /comb_logic { (context /comb_logic )&{KEY1 , KEY0 }} Keys
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand /comb_logic/Keys
add wave -noupdate /comb_logic/KEY1
add wave -noupdate /comb_logic/KEY0
add wave -noupdate /comb_logic/LED0
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1 ns}
