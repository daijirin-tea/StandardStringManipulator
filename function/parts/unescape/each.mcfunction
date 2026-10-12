data modify storage ssm: w.data.item set from storage ssm: w.data.input_copy[0]

execute unless data storage ssm: w.data.item{} run data modify storage ssm: w.data.output.result append from storage ssm: w.data.item
execute unless data storage ssm: w.data.item{} run data remove storage ssm: w.data.input_copy[0]
execute unless data storage ssm: w.data.item{} run return run execute if data storage ssm: w.data.input_copy[0] run function ssm:parts/unescape/each

execute unless data storage ssm: w.data.item{type:"backslash"} run return run data modify storage ssm: w.data.output set value {error:1b}

data remove storage ssm: w.data.input_copy[0]
execute unless data storage ssm: w.data.input_copy[0] run return run data modify storage ssm: w.data.output set value {error:1b}
data modify storage ssm: w.data.output.result append from storage ssm: w.data.input_copy[0]

data remove storage ssm: w.data.input_copy[0]
execute if data storage ssm: w.data.input_copy[0] run function ssm:parts/unescape/each