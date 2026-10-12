function ssm:save_frame
data modify storage ssm: temporary set from storage ssm: w
data modify storage ssm: w set value {}
data modify storage ssm: w.input set from storage ssm: temporary.data.input_copy[0]
data modify storage ssm: frames append from storage ssm: w
function ssm:parts/parse/main
data remove storage ssm: frames[-1]
data modify storage ssm: temporary set from storage ssm: w
function ssm:set_frame

data modify storage ssm: w.data.parts_list append from storage ssm: temporary.output

data remove storage ssm: w.data.input_copy[0]
execute if data storage ssm: w.data.input_copy[0] run function ssm:string/concat/each