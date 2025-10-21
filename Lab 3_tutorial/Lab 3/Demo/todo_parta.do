vsim aluparta -gn=16
vsim -gui work.aluparta
add wave -position end  sim:/aluparta/Cin
add wave -position end  sim:/aluparta/S
add wave -position end  sim:/aluparta/A
add wave -position end  sim:/aluparta/B
add wave -position end  sim:/aluparta/F
add wave -position end  sim:/aluparta/Cout
force -freeze sim:/aluparta/Cin 0 0
force -freeze sim:/aluparta/S 0 0
force -freeze sim:/aluparta/A 0F0F 0
run
force -freeze sim:/aluparta/S 1 0
force -freeze sim:/aluparta/B 0001 0
run
force -freeze sim:/aluparta/S 2 0
force -freeze sim:/aluparta/A FFFF 0
run
force -freeze sim:/aluparta/S 3 0
force -freeze sim:/aluparta/B XXXX 0
run
force -freeze sim:/aluparta/Cin 1 0
force -freeze sim:/aluparta/S 0 0
force -freeze sim:/aluparta/A 0F0E 0
run
force -freeze sim:/aluparta/S 1 0
force -freeze sim:/aluparta/A FFFF 0
force -freeze sim:/aluparta/B 0001 0
run
force -freeze sim:/aluparta/S 2 0
force -freeze sim:/aluparta/A 0F0F 0
run
force -freeze sim:/aluparta/S 3 0
run
