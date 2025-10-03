#this line is a comment
#this command open the simulation for the entity named "myand"
vsim -gui work.alu_top
#add the signals you want to test in the wave
add wave -position insertpoint  \
sim:/alu_top/S \
sim:/alu_top/A \
sim:/alu_top/B \
sim:/alu_top/Cin \
sim:/alu_top/F \
sim:/alu_top/F_A \
sim:/alu_top/F_B \
sim:/alu_top/F_C \
sim:/alu_top/F_D \
sim:/alu_top/Cout \

#for value 1 on a and 1 on b
force -freeze sim:/alu_top/S 4'b1000
force -freeze sim:/alu_top/A 16'hA00A
force -freeze sim:/alu_top/B 16'h000B
force -freeze sim:/alu_top/Cin 1'b1
#run simulation and see what happens
run

#for value 1 on a and 1 on b
force -freeze sim:/alu_top/S 4'b1000
force -freeze sim:/alu_top/A 16'h000A
force -freeze sim:/alu_top/B 16'h000B
force -freeze sim:/alu_top/Cin 1'b1
#run simulation and see what happens
run

#for value 1 on a and 1 on b
force -freeze sim:/alu_top/S 4'b1001
force -freeze sim:/alu_top/A 16'hB00C
force -freeze sim:/alu_top/B 16'h000B
force -freeze sim:/alu_top/Cin 1'b1
#run simulation and see what happens
run

#for value 1 on a and 1 on b
force -freeze sim:/alu_top/S 4'b1001
force -freeze sim:/alu_top/A 16'h000C
force -freeze sim:/alu_top/B 16'h000B
force -freeze sim:/alu_top/Cin 1'b1
#run simulation and see what happens
run

#for value 1 on a and 1 on b
force -freeze sim:/alu_top/S 4'b1010
force -freeze sim:/alu_top/A 16'hA00A
force -freeze sim:/alu_top/B 16'h000B
force -freeze sim:/alu_top/Cin 1'b0
#run simulation and see what happens
run


#for value 1 on a and 1 on b
force -freeze sim:/alu_top/S 4'b1010
force -freeze sim:/alu_top/A 16'hA00A
force -freeze sim:/alu_top/B 16'h000B
force -freeze sim:/alu_top/Cin 1'b1
#run simulation and see what happens
run


#for value 1 on a and 1 on b
force -freeze sim:/alu_top/S 4'b1011
force -freeze sim:/alu_top/A 16'hA00A
force -freeze sim:/alu_top/B 16'h000B
force -freeze sim:/alu_top/Cin 1'b0
#run simulation and see what happens
run

#for value 1 on a and 1 on b
force -freeze sim:/alu_top/S 4'b0000
force -freeze sim:/alu_top/A 16'h0000
force -freeze sim:/alu_top/B 16'h0000
force -freeze sim:/alu_top/Cin 1'b0
#run simulation and see what happens
run

#for value 1 on a and 1 on b
force -freeze sim:/alu_top/S 4'b1100
force -freeze sim:/alu_top/A 16'h000F
force -freeze sim:/alu_top/B 16'h0000
force -freeze sim:/alu_top/Cin 1'b0
#run simulation and see what happens
run

#for value 1 on a and 1 on b
force -freeze sim:/alu_top/S 4'b1101
force -freeze sim:/alu_top/A 16'h0F0F
force -freeze sim:/alu_top/B 16'h0000
force -freeze sim:/alu_top/Cin 1'b0
#run simulation and see what happens
run

#for value 1 on a and 1 on b
force -freeze sim:/alu_top/S 4'b1110
force -freeze sim:/alu_top/A 16'h0F0F
force -freeze sim:/alu_top/B 16'h0000
force -freeze sim:/alu_top/Cin 1'b0
#run simulation and see what happens
run

#for value 1 on a and 1 on b
force -freeze sim:/alu_top/S 4'b1111
force -freeze sim:/alu_top/A 16'hF000
force -freeze sim:/alu_top/B 16'h0000
force -freeze sim:/alu_top/Cin 1'b0
#run simulation and see what happens
run

#for value 1 on a and 1 on b
force -freeze sim:/alu_top/S 4'b1110
force -freeze sim:/alu_top/A 16'h0F00
force -freeze sim:/alu_top/B 16'h0000
force -freeze sim:/alu_top/Cin 1'b1
#run simulation and see what happens
run
# Test ALU_B OR operation
force -freeze sim:/alu_top/S 4'b0100
force -freeze sim:/alu_top/A 16'h00FF
force -freeze sim:/alu_top/B 16'h0F0F
run

# Test ALU_B AND operation
force -freeze sim:/alu_top/S 4'b0101
force -freeze sim:/alu_top/A 16'h00FF
force -freeze sim:/alu_top/B 16'h0F0F
run

# Test ALU_B NOR operation
force -freeze sim:/alu_top/S 4'b0110
force -freeze sim:/alu_top/A 16'h00FF
force -freeze sim:/alu_top/B 16'h0F0F
run

# Test ALU_B NOT operation
force -freeze sim:/alu_top/S 4'b0111
force -freeze sim:/alu_top/A 16'h00FF
run
# ---------------------------------------------------
# Test cases for Part A
# ---------------------------------------------------

# F = A (S=0000, Cin=0) -> Expected F=0F0F, Cout=0
force -freeze sim:/alu_top/S 4'b0000
force -freeze sim:/alu_top/A 16'h0F0F
force -freeze sim:/alu_top/B 16'h0000
force -freeze sim:/alu_top/Cin 1'b0
run 

# F = A-B (S=0001, Cin=0) -> Expected F=0F0E, Cout=0
force -freeze sim:/alu_top/S 4'b0001
force -freeze sim:/alu_top/A 16'h0F0F
force -freeze sim:/alu_top/B 16'h0001
force -freeze sim:/alu_top/Cin 1'b0
run 

# F = A-B+1 (S=0010, Cin=0) -> Expected F=FFFF, Cout=0
force -freeze sim:/alu_top/S 4'b0010
force -freeze sim:/alu_top/A 16'hFFFF
force -freeze sim:/alu_top/B 16'h0001
force -freeze sim:/alu_top/Cin 1'b0
run 

# F = A-1 (S=0011, Cin=0) -> Expected F=FFFE, Cout=0
force -freeze sim:/alu_top/S 4'b0011
force -freeze sim:/alu_top/A 16'hFFFF
force -freeze sim:/alu_top/B 16'h0000
force -freeze sim:/alu_top/Cin 1'b0
run 

# F = A+1 (S=0000, Cin=1) -> Expected F=0F0F, Cout=0
force -freeze sim:/alu_top/S 4'b0000
force -freeze sim:/alu_top/A 16'h0F0E
force -freeze sim:/alu_top/B 16'h0000
force -freeze sim:/alu_top/Cin 1'b1
run 

# F = A-B-1 (S=0001, Cin=1) -> Expected F=FFFD, Cout=0
force -freeze sim:/alu_top/S 4'b0001
force -freeze sim:/alu_top/A 16'hFFFF
force -freeze sim:/alu_top/B 16'h0001
force -freeze sim:/alu_top/Cin 1'b1
run 

# F = A+B+1 (S=0010, Cin=1) -> Expected F=0F11, Cout=0
force -freeze sim:/alu_top/S 4'b0010
force -freeze sim:/alu_top/A 16'h0F0F
force -freeze sim:/alu_top/B 16'h0001
force -freeze sim:/alu_top/Cin 1'b1
run 

# F = B+1 (S=0011, Cin=1) -> Expected F=0002, Cout=0
force -freeze sim:/alu_top/S 4'b0011
force -freeze sim:/alu_top/A 16'h0F0F   ;# A don't care
force -freeze sim:/alu_top/B 16'h0001
force -freeze sim:/alu_top/Cin 1'b1
run 

# ---------------------------------------------------