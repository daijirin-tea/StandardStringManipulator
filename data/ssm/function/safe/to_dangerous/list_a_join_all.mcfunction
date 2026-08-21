data modify storage ssm: w.data.list_a_copy set from storage ssm: w.data.list_a
data modify storage ssm: w.data.list_a set value []
function ssm:safe/to_dangerous/list_a_join with storage ssm: w.data

execute store success score $ssm ssm_success run data get storage ssm: w.data.list_a[1]
execute if score $ssm ssm_success matches 1 run function ssm:safe/to_dangerous/list_a_join_all