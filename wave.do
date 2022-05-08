onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /top_tb/topTest/ctrl/clk
add wave -noupdate -radix hexadecimal /top_tb/topTest/ctrl/rst
add wave -noupdate -radix hexadecimal /top_tb/topTest/ctrl/state
add wave -noupdate -radix hexadecimal /top_tb/topTest/ctrl/bias_addr
add wave -noupdate -radix binary /top_tb/topTest/ctrl/bias_load
add wave -noupdate -label {pixel addr} -radix decimal /top_tb/topTest/ctrl/pixel_addr
add wave -noupdate -label {bias1 mem} -radix hexadecimal -childformat {{{/top_tb/topTest/b1/output_value[31]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[30]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[29]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[28]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[27]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[26]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[25]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[24]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[23]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[22]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[21]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[20]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[19]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[18]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[17]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[16]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[15]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[14]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[13]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[12]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[11]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[10]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[9]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[8]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[7]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[6]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[5]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[4]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[3]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[2]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[1]} -radix hexadecimal} {{/top_tb/topTest/b1/output_value[0]} -radix hexadecimal}} -subitemconfig {{/top_tb/topTest/b1/output_value[31]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[30]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[29]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[28]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[27]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[26]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[25]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[24]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[23]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[22]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[21]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[20]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[19]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[18]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[17]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[16]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[15]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[14]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[13]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[12]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[11]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[10]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[9]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[8]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[7]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[6]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[5]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[4]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[3]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[2]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[1]} {-height 15 -radix hexadecimal} {/top_tb/topTest/b1/output_value[0]} {-height 15 -radix hexadecimal}} /top_tb/topTest/b1/output_value
add wave -noupdate -label {bias2 mem} -radix hexadecimal -radixshowbase 0 /top_tb/topTest/b2/output_value
add wave -noupdate -label {test mem} -radix hexadecimal -radixshowbase 0 /top_tb/topTest/t0/output_value
add wave -noupdate -divider {neuron ctrl}
add wave -noupdate -label valid -radix hexadecimal /top_tb/topTest/n0/valid
add wave -noupdate -label {clk offset valid} -radix hexadecimal /top_tb/topTest/n0/valid2
add wave -noupdate -divider n0
add wave -noupdate -label {n0 prod} -radix hexadecimal /top_tb/topTest/n0/prod
add wave -noupdate -label {n0 value} -radix hexadecimal /top_tb/topTest/n0/value
add wave -noupdate -label {n0 weight} -radix hexadecimal /top_tb/topTest/n0/weight
add wave -noupdate -label {n0 sum} -radix hexadecimal /top_tb/topTest/n0/sum
add wave -noupdate -label {n0 relu} -radix hexadecimal /top_tb/topTest/n0/relu_output
add wave -noupdate -divider n1
add wave -noupdate -label {n1 value} -radix hexadecimal /top_tb/topTest/n1/value
add wave -noupdate -label {n1 weight} -radix hexadecimal /top_tb/topTest/n1/weight
add wave -noupdate -label {n1 sum} -radix hexadecimal /top_tb/topTest/n1/sum
add wave -noupdate -label {n1 relu} -radix hexadecimal /top_tb/topTest/n1/relu_output
add wave -noupdate -divider n2
add wave -noupdate -label {n2 value} -radix hexadecimal /top_tb/topTest/n2/value
add wave -noupdate -label {n2 weight} -radix hexadecimal /top_tb/topTest/n2/weight
add wave -noupdate -label {n2 sum} -radix hexadecimal /top_tb/topTest/n2/sum
add wave -noupdate -label {n2 relu} -radix hexadecimal /top_tb/topTest/n2/relu_output
add wave -noupdate -divider n3
add wave -noupdate -label {n3 value} -radix hexadecimal /top_tb/topTest/n3/value
add wave -noupdate -label {n3 weight} -radix hexadecimal /top_tb/topTest/n3/weight
add wave -noupdate -label {n3 sum} -radix hexadecimal /top_tb/topTest/n3/sum
add wave -noupdate -label {n3 relu} -radix hexadecimal /top_tb/topTest/n3/relu_output
add wave -noupdate -divider n10
add wave -noupdate -label {n10 value} -radix hexadecimal /top_tb/topTest/n10/value
add wave -noupdate -label {n10 weight} -radix hexadecimal /top_tb/topTest/n10/weight
add wave -noupdate -label {n10 sum} -radix hexadecimal /top_tb/topTest/n10/sum
add wave -noupdate -divider {digit output}
add wave -noupdate -label d0 -radix hexadecimal {/top_tb/topTest/digit_output[0]}
add wave -noupdate -label d1 -radix hexadecimal {/top_tb/topTest/digit_output[1]}
add wave -noupdate -label d2 -radix hexadecimal {/top_tb/topTest/digit_output[2]}
add wave -noupdate -label d3 -radix hexadecimal {/top_tb/topTest/digit_output[3]}
add wave -noupdate -label d4 -radix hexadecimal {/top_tb/topTest/digit_output[4]}
add wave -noupdate -label d5 -radix hexadecimal {/top_tb/topTest/digit_output[5]}
add wave -noupdate -label d6 -radix hexadecimal {/top_tb/topTest/digit_output[6]}
add wave -noupdate -label d7 -radix hexadecimal {/top_tb/topTest/digit_output[7]}
add wave -noupdate -label d8 -radix hexadecimal {/top_tb/topTest/digit_output[8]}
add wave -noupdate -label d9 -radix hexadecimal {/top_tb/topTest/digit_output[9]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {8161875 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 178
configure wave -valuecolwidth 120
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
WaveRestoreZoom {8033932 ps} {8193343 ps}
