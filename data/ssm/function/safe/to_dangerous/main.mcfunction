#storage ssm: $(id).input ... string ("->%22, \->%5c, %->%25 にエンコード済み)
#storage ssm: $(id).output ... string ("や\も含まれる)

#with storageを使用するとき用
$data modify storage ssm: $(id).id set value $(id)

$data modify storage ssm: $(id).output set value []
$data modify storage ssm: $(id).element set value ""
$data modify storage ssm: $(id).list_a set value []

$execute store result storage ssm: $(id).start_index int 1 run scoreboard players set $$(id) ssm_start_index 0
$execute store result storage ssm: $(id).end_index int 1 run scoreboard players set $$(id) ssm_end_index 1
$execute store result storage ssm: $(id).end_index2 int 1 run scoreboard players set $$(id) ssm_end_index2 3

$scoreboard players set $$(id) ssm_length 0

#["abcd","\"","e","\\","f","%","g"]のようにする。ssm_lengthに長さを代入
$function ssm:safe/to_dangerous/each with storage ssm: $(id)
$function ssm:safe/to_dangerous/add_element {id:$(id)}

$execute store result storage ssm: $(id).ideal_length int 1 run scoreboard players set $$(id) ssm_ideal_length 2

$scoreboard players set $$(id) ssm_join_count 1

#ideal_lengthが2^nになるかつ、ideal_length > lengthになるよう調整
$function ssm:safe/to_dangerous/set_ideal_length with storage ssm: $(id)

#後ろに挿入する空文字の数
$scoreboard players operation $$(id) ssm_count = $$(id) ssm_ideal_length
$scoreboard players operation $$(id) ssm_count -= $$(id) ssm_length

$execute if score $$(id) ssm_count matches 1.. run function ssm:safe/to_dangerous/append_empty {id:$(id)}

#["\"","a","\"",""]を["\\\\\\\"","a","\\\\\\\"",""]に変換
$data modify storage ssm: $(id).list_a_copy set from storage ssm: $(id).list_a
$data modify storage ssm: $(id).list_a set value []
$function ssm:safe/to_dangerous/list_a_each {id:$(id)}

#list_aを2つずつjoinする
$function ssm:safe/to_dangerous/list_a_join_all {id:$(id)}

$data modify storage ssm: $(id).output set from storage ssm: $(id).list_a[0]

$scoreboard players reset $$(id) ssm_start_index
$scoreboard players reset $$(id) ssm_end_index
$scoreboard players reset $$(id) ssm_end_index2
$scoreboard players reset $$(id) ssm_success
$scoreboard players reset $$(id) ssm_success2
$scoreboard players reset $$(id) ssm_length
$scoreboard players reset $$(id) ssm_ideal_length
$scoreboard players reset $$(id) ssm_ideal_length_next
$scoreboard players reset $$(id) ssm_count
$scoreboard players reset $$(id) ssm_join_count
$scoreboard players reset $$(id) ssm_join_count2