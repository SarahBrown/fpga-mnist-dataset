onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /top_tb/topTest/ctrl/clk
add wave -noupdate -radix hexadecimal /top_tb/topTest/ctrl/rst
add wave -noupdate -radix hexadecimal /top_tb/topTest/ctrl/state
add wave -noupdate -radix hexadecimal /top_tb/topTest/ctrl/bias_addr
add wave -noupdate -radix binary /top_tb/topTest/ctrl/bias_load
add wave -noupdate -label {pixel addr} -radix hexadecimal /top_tb/topTest/ctrl/pixel_addr
add wave -noupdate -label {bias mem} -radix hexadecimal /top_tb/topTest/b1/output_value
add wave -noupdate -label {test mem} -radix hexadecimal -radixshowbase 0 /top_tb/topTest/t0/output_value
add wave -noupdate -divider {neuron ctrl}
add wave -noupdate -radix hexadecimal /top_tb/topTest/n0/valid
add wave -noupdate -radix hexadecimal /top_tb/topTest/n0/valid2
add wave -noupdate -radix hexadecimal /top_tb/topTest/n0/bias_load
add wave -noupdate -divider neurons
add wave -noupdate -radix hexadecimal /top_tb/topTest/n0/prod
add wave -noupdate -radix hexadecimal /top_tb/topTest/n0/value
add wave -noupdate -radix hexadecimal /top_tb/topTest/n0/weight
add wave -noupdate -radix hexadecimal /top_tb/topTest/n0/sum
add wave -noupdate -radix hexadecimal /top_tb/topTest/n0/relu_output
add wave -noupdate -radix hexadecimal /top_tb/topTest/n1/value
add wave -noupdate -radix hexadecimal /top_tb/topTest/n1/weight
add wave -noupdate -radix hexadecimal /top_tb/topTest/n1/sum
add wave -noupdate -radix hexadecimal /top_tb/topTest/n1/relu_output
add wave -noupdate -radix hexadecimal /top_tb/topTest/n2/value
add wave -noupdate -radix hexadecimal /top_tb/topTest/n2/weight
add wave -noupdate -radix hexadecimal /top_tb/topTest/n2/sum
add wave -noupdate -radix hexadecimal /top_tb/topTest/n2/relu_output
add wave -noupdate -radix hexadecimal /top_tb/topTest/n3/value
add wave -noupdate -radix hexadecimal /top_tb/topTest/n3/weight
add wave -noupdate -radix hexadecimal /top_tb/topTest/n3/sum
add wave -noupdate -radix hexadecimal /top_tb/topTest/n3/relu_output
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7964017 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 222
configure wave -valuecolwidth 47
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {7718392 ps} {7879635 ps}
