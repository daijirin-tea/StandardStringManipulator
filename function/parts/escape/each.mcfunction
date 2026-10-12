data modify storage ssm: w.data.item set from storage ssm: w.data.input_copy[0]

execute if data storage ssm: w.data.item{} run data modify storage ssm: w.data.output append value {type:"backslash"}
data modify storage ssm: w.data.output append from storage ssm: w.data.item

data remove storage ssm: w.data.input_copy[0]
execute if data storage ssm: w.data.input_copy[0] run function ssm:parts/escape/each