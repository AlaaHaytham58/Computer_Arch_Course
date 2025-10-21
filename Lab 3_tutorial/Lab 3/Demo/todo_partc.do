vsim alupartc -gn=16
vsim -gui work.alupartc
add wave -position end  sim:/alupartc/Cin
add wave -position end  sim:/alupartc/S
add wave -position end  sim:/alupartc/A
add wave -position end  sim:/alupartc/B
add wave -position end  sim:/alupartc/F
add wave -position end  sim:/alupartc/Cout
force -freeze sim:/alupartc/S 8 0
force -freeze sim:/alupartc/A A00A 0
run
force -freeze sim:/alupartc/A 000A 0
run
force -freeze sim:/alupartc/S 9 0
force -freeze sim:/alupartc/A B00C 0
run
force -freeze sim:/alupartc/A 000C 0
run
force -freeze sim:/alupartc/Cin 0 0
force -freeze sim:/alupartc/S A 0
force -freeze sim:/alupartc/A A00A 0
run
force -freeze sim:/alupartc/Cin 1 0
run
force -freeze sim:/alupartc/Cin X 0
force -freeze sim:/alupartc/S B 0
run
