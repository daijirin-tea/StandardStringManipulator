data modify storage ssm: w.data.item_0 set from storage ssm: w.data.list_a[0]
data modify storage ssm: w.data.item_1 set from storage ssm: w.data.list_a[1]
data remove storage ssm: w.data.list_a[0]
data remove storage ssm: w.data.list_a[0]
function ssm:parts/stringify/join_macro with storage ssm: w.data

execute if data storage ssm: w.data.list_a[1] run function ssm:parts/stringify/join_each