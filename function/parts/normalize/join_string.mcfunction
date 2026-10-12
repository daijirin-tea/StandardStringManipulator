$data modify storage ssm: w.data.before_item set value "$(before_item)$(item_parts_initial)"
data modify storage ssm: w.data.output[-1] set from storage ssm: w.data.before_item
data remove storage ssm: w.data.item_parts[0]