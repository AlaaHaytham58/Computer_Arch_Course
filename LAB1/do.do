# Open the simulation for the entity named "alu"
vsim -gui work.alu

# Add the signals you want to test in the wave
add wave -position insertpoint \
sim:/alu/A \
sim:/alu/B \
sim:/alu/S \
sim:/alu/F \
sim:/alu/Cout

# Test vector 1: A = 1, B = 1, S = "0101" (AND)
force -freeze sim:/alu/A 16#0001 0
force -freeze sim:/alu/B 16#0001 0
force -freeze sim:/alu/S "0101" 0
run 10 ns

# Test vector 2: A = 0, B = 1, S = "0100" (OR)
force -freeze sim:/alu/A 16#0000 0
force -freeze sim:/alu/B 16#0001 0
force -freeze sim:/alu/S "0100" 0
run 10 ns

# Test vector 3: A = 1, B = 0, S = "0110" (NOR)
force -freeze sim:/alu/A 16#0001 0
force -freeze sim:/alu/B 16#0000 0
force -freeze sim:/alu/S "0110" 0
run 10 ns

# Test vector 4: A = 0, B = 0, S = "0111" (NOT A)
force -freeze sim:/alu/A 16#0000 0
force -freeze sim:/alu/B 16#0000 0
force -freeze sim:/alu/S "0111" 0
run 10 ns