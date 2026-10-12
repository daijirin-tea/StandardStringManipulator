data modify storage ssm: w.data.list_b set value []
function ssm:parts/stringify/join_each

data modify storage ssm: w.data.list_a set from storage ssm: w.data.list_b
execute if data storage ssm: w.data.list_a[1] run function ssm:parts/stringify/join