data modify storage ssm: w.data.output append from storage ssm: w.data.item_parts[0]

data remove storage ssm: w.data.item_parts[0]
execute if data storage ssm: w.data.item_parts[0] run function ssm:parts/normalize/concat