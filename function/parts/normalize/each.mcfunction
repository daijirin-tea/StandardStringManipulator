execute unless data storage ssm: w.data.input_copy[0] run return 1
data modify storage ssm: w.data.before_item set from storage ssm: w.data.output[-1]
data modify storage ssm: w.data.item set from storage ssm: w.data.input_copy[0]

execute if data storage ssm: w.data{item:""} run return run function ssm:parts/normalize/continue

execute if data storage ssm: w.data.item{} run data modify storage ssm: w.data.output append from storage ssm: w.data.item
execute if data storage ssm: w.data.item{} run return run function ssm:parts/normalize/each

function ssm:parts/normalize/item_parts
data remove storage ssm: w.data.item_parts_initial
data modify storage ssm: w.data.item_parts_initial set from storage ssm: w.data.item_parts[0]

execute if data storage ssm: w.data.item_parts_initial unless data storage ssm: w.data.before_item{} unless data storage ssm: w.data.item_parts_initial{} run function ssm:parts/normalize/join_string with storage ssm: w.data

execute if data storage ssm: w.data.item_parts[0] run function ssm:parts/normalize/concat

data remove storage ssm: w.data.input_copy[0]
function ssm:parts/normalize/each