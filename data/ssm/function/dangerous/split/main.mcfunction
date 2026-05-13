#storage ssm: $(id).input ... string ("や\も含まれる)
#storage ssm: $(id).output ... string[] ("や\も含まれる)

#with storageを使用するとき用
$data modify storage ssm: $(id).id set value $(id)

$data modify storage ssm: $(id).output set value []

$execute store result storage ssm: $(id).start_index int 1 run scoreboard players set $$(id) ssm_start_index 0
$execute store result storage ssm: $(id).end_index int 1 run scoreboard players set $$(id) ssm_end_index 1

$function ssm:dangerous/to_safe/each with storage ssm: $(id)

$scoreboard players reset $$(id) ssm_start_index
$scoreboard players reset $$(id) ssm_end_index
$scoreboard players reset $$(id) ssm_success