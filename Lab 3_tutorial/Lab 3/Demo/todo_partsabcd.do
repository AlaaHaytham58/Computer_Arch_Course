vsim alupartsabcd -gn=16
vsim -gui work.alupartsabcd

add wave -position end  sim:/alupartsabcd/Cin
add wave -position end  sim:/alupartsabcd/S
add wave -position end  sim:/alupartsabcd/A
add wave -position end  sim:/alupartsabcd/B
add wave -position end  sim:/alupartsabcd/F
add wave -position end  sim:/alupartsabcd/Cout

force -freeze sim:/alupartsabcd/Cin 0 0
force -freeze sim:/alupartsabcd/S 0 0
force -freeze sim:/alupartsabcd/A 0F0F 0
run
force -freeze sim:/alupartsabcd/S 1 0
force -freeze sim:/alupartsabcd/B 0001 0
run
force -freeze sim:/alupartsabcd/S 2 0
force -freeze sim:/alupartsabcd/A FFFF 0
run
force -freeze sim:/alupartsabcd/S 3 0
force -freeze sim:/alupartsabcd/B XXXX 0
run
force -freeze sim:/alupartsabcd/Cin 1 0
force -freeze sim:/alupartsabcd/S 0 0
force -freeze sim:/alupartsabcd/A 0F0E 0
run
force -freeze sim:/alupartsabcd/S 1 0
force -freeze sim:/alupartsabcd/A FFFF 0
force -freeze sim:/alupartsabcd/B 0001 0
run
force -freeze sim:/alupartsabcd/S 2 0
force -freeze sim:/alupartsabcd/A 0F0F 0
run
force -freeze sim:/alupartsabcd/S 3 0
run

force -freeze sim:/alupartsabcd/Cin X 0
force -freeze sim:/alupartsabcd/S 0100 0
force -freeze sim:/alupartsabcd/S(2) 1 0
force -freeze sim:/alupartsabcd/A F000 0
force -freeze sim:/alupartsabcd/B 00B0 0
run
force -freeze sim:/alupartsabcd/S(0) 1 0
force -freeze sim:/alupartsabcd/B 000B 0
run
force -freeze sim:/alupartsabcd/S(1) 1 0
force -freeze sim:/alupartsabcd/S(0) 0 0
force -freeze sim:/alupartsabcd/B B000 0
run
force -freeze sim:/alupartsabcd/B XXXX 0
force -freeze sim:/alupartsabcd/S(0) 1 0
run

force -freeze sim:/alupartsabcd/S 8 0
force -freeze sim:/alupartsabcd/A A00A 0
run
force -freeze sim:/alupartsabcd/A 000A 0
run
force -freeze sim:/alupartsabcd/S 9 0
force -freeze sim:/alupartsabcd/A B00C 0
run
force -freeze sim:/alupartsabcd/A 000C 0
run
force -freeze sim:/alupartsabcd/Cin 0 0
force -freeze sim:/alupartsabcd/S A 0
force -freeze sim:/alupartsabcd/A A00A 0
run
force -freeze sim:/alupartsabcd/Cin 1 0
run
force -freeze sim:/alupartsabcd/Cin X 0
force -freeze sim:/alupartsabcd/S B 0
run

force -freeze sim:/alupartsabcd/Cin X 0
force -freeze sim:/alupartsabcd/S C 0
force -freeze sim:/alupartsabcd/A 000F 0
run
force -freeze sim:/alupartsabcd/S D 0
force -freeze sim:/alupartsabcd/A 0F0F 0
run
force -freeze sim:/alupartsabcd/Cin 0 0
force -freeze sim:/alupartsabcd/S E 0
run
force -freeze sim:/alupartsabcd/Cin X 0
force -freeze sim:/alupartsabcd/S F 0
force -freeze sim:/alupartsabcd/A F000 0
run
force -freeze sim:/alupartsabcd/Cin 1 0
force -freeze sim:/alupartsabcd/S E 0
force -freeze sim:/alupartsabcd/A 0F00 0
run
