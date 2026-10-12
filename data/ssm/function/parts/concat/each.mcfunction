execute unless data storage ssm: w.data.input_copy[1] run return 1
execute unless data storage ssm: w.data.input_copy[1][0] run return run function ssm:parts/concat/continue

data modify storage ssm: w.data.input_copy[0] append from storage ssm: w.data.input_copy[1][0]
data remove storage ssm: w.data.input_copy[1][0]

data modify storage ssm: w.data.left set value ""
data modify storage ssm: w.data.right set value ""
data modify storage ssm: w.data.left set from storage ssm: w.data.input_copy[0][-2]
data modify storage ssm: w.data.right set from storage ssm: w.data.input_copy[0][-1]

execute unless data storage ssm: w.data.left{} unless data storage ssm: w.data.right{} run function ssm:parts/concat/join_string with storage ssm: w.data

function ssm:parts/concat/each