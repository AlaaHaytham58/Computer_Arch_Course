vsim alupartd -gn=16
vsim -gui work.alupartd
add wave -position end  sim:/alupartd/Cin
add wave -position end  sim:/alupartd/S
add wave -position end  sim:/alupartd/A
add wave -position end  sim:/alupartd/B
add wave -position end  sim:/alupartd/F
add wave -position end  sim:/alupartd/Cout
force -freeze sim:/alupartd/Cin X 0
force -freeze sim:/alupartd/S C 0
force -freeze sim:/alupartd/A 000F 0
run
force -freeze sim:/alupartd/S D 0
force -freeze sim:/alupartd/A 0F0F 0
run
force -freeze sim:/alupartd/Cin 0 0
force -freeze sim:/alupartd/S E 0
run
force -freeze sim:/alupartd/Cin X 0
force -freeze sim:/alupartd/S F 0
force -freeze sim:/alupartd/A F000 0
run
force -freeze sim:/alupartd/Cin 1 0
force -freeze sim:/alupartd/S E 0
force -freeze sim:/alupartd/A 0F00 0
run
