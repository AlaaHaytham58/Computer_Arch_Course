vsim alupartsbcd -gn=16
vsim -gui work.alupartsbcd

add wave -position end  sim:/alupartsbcd/Cin
add wave -position end  sim:/alupartsbcd/S
add wave -position end  sim:/alupartsbcd/A
add wave -position end  sim:/alupartsbcd/B
add wave -position end  sim:/alupartsbcd/F
add wave -position end  sim:/alupartsbcd/Cout

force -freeze sim:/alupartsbcd/Cin X 0
force -freeze sim:/alupartsbcd/S 0100 0
force -freeze sim:/alupartsbcd/S(2) 1 0
force -freeze sim:/alupartsbcd/A F000 0
force -freeze sim:/alupartsbcd/B 00B0 0
run
force -freeze sim:/alupartsbcd/S(0) 1 0
force -freeze sim:/alupartsbcd/B 000B 0
run
force -freeze sim:/alupartsbcd/S(1) 1 0
force -freeze sim:/alupartsbcd/S(0) 0 0
force -freeze sim:/alupartsbcd/B B000 0
run
force -freeze sim:/alupartsbcd/B XXXX 0
force -freeze sim:/alupartsbcd/S(0) 1 0
run

force -freeze sim:/alupartsbcd/S 8 0
force -freeze sim:/alupartsbcd/A A00A 0
run
force -freeze sim:/alupartsbcd/A 000A 0
run
force -freeze sim:/alupartsbcd/S 9 0
force -freeze sim:/alupartsbcd/A B00C 0
run
force -freeze sim:/alupartsbcd/A 000C 0
run
force -freeze sim:/alupartsbcd/Cin 0 0
force -freeze sim:/alupartsbcd/S A 0
force -freeze sim:/alupartsbcd/A A00A 0
run
force -freeze sim:/alupartsbcd/Cin 1 0
run
force -freeze sim:/alupartsbcd/Cin X 0
force -freeze sim:/alupartsbcd/S B 0
run

force -freeze sim:/alupartsbcd/Cin X 0
force -freeze sim:/alupartsbcd/S C 0
force -freeze sim:/alupartsbcd/A 000F 0
run
force -freeze sim:/alupartsbcd/S D 0
force -freeze sim:/alupartsbcd/A 0F0F 0
run
force -freeze sim:/alupartsbcd/Cin 0 0
force -freeze sim:/alupartsbcd/S E 0
run
force -freeze sim:/alupartsbcd/Cin X 0
force -freeze sim:/alupartsbcd/S F 0
force -freeze sim:/alupartsbcd/A F000 0
run
force -freeze sim:/alupartsbcd/Cin 1 0
force -freeze sim:/alupartsbcd/S E 0
force -freeze sim:/alupartsbcd/A 0F00 0
run
