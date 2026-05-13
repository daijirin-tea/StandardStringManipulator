#storage ssm: $(id).input ... string ("->%22, \->%5c, %->%25 にエンコード済み)
#storage ssm: $(id).output ... string[] ("->%22, \->%5c, %->%25 にエンコード済み)

#with storageを使用するとき用
$data modify storage ssm: $(id).id set value $(id)

$data modify storage ssm: $(id).output set value []

$execute store result storage ssm: $(id).start_index int 1 run scoreboard players set $$(id) ssm_start_index 0
$execute store result storage ssm: $(id).end_index int 1 run scoreboard players set $$(id) ssm_end_index 1
$execute store result storage ssm: $(id).end_index2 int 1 run scoreboard players set $$(id) ssm_end_index2 3

$function ssm:safe/split/each with storage ssm: $(id)

$scoreboard players reset $$(id) ssm_start_index
$scoreboard players reset $$(id) ssm_end_index
$scoreboard players reset $$(id) ssm_end_index2
$scoreboard players reset $$(id) ssm_success