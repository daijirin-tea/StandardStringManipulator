data remove storage ssm: w.data.item
execute store success score $ssm ssm_success run data modify storage ssm: w.data.item set from storage ssm: w.data.input_copy[0]
execute if score $ssm ssm_success matches 0 run return 1
data remove storage ssm: w.data.input_copy[0]

execute unless data storage ssm: w.data.item{} run data modify storage ssm: w.data.list_a append from storage ssm: w.data.item
execute unless data storage ssm: w.data.item{} run return run function ssm:parts/stringify/each

execute if data storage ssm: w.data.item{type:"backslash"} run data modify storage ssm: w.data.list_a append from storage ssm: w.data.backslash
execute if data storage ssm: w.data.item{type:"double_quotation"} run data modify storage ssm: w.data.list_a append from storage ssm: w.data.double_quotation
function ssm:parts/stringify/each