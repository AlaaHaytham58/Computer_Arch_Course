vsim alupartb -gn=16
vsim -gui work.alupartb
add wave -position end  sim:/alupartb/Cin
add wave -position end  sim:/alupartb/S
add wave -position end  sim:/alupartb/A
add wave -position end  sim:/alupartb/B
add wave -position end  sim:/alupartb/F
add wave -position end  sim:/alupartb/Cout
force -freeze sim:/alupartb/Cin X 0
force -freeze sim:/alupartb/S 0100 0
force -freeze sim:/alupartb/S(2) 1 0
force -freeze sim:/alupartb/A F000 0
force -freeze sim:/alupartb/B 00B0 0
run
force -freeze sim:/alupartb/S(0) 1 0
force -freeze sim:/alupartb/B 000B 0
run
force -freeze sim:/alupartb/S(1) 1 0
force -freeze sim:/alupartb/S(0) 0 0
force -freeze sim:/alupartb/B B000 0
run
force -freeze sim:/alupartb/B XXXX 0
force -freeze sim:/alupartb/S(0) 1 0
run
