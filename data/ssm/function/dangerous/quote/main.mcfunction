#storage ssm: $(id).input ... string ("や\も含まれる)
#storage ssm: $(id).output ... string ("や\も含まれる)

#with storageを使用するとき用
$data modify storage ssm: $(id).id set value $(id)

#split
$execute store result storage ssm: $(id).child_id int 1 run random value 0..2147483646
$function ssm:dangerous/quote/split with storage ssm: $(id)

#"\""" -> "\\\"" , "\\" -> "\\\\"
$data modify storage ssm: $(id).replaced_list set value []
$function ssm:dangerous/quote/each {id:$(id)}

$data modify storage ssm: $(id).replaced_list prepend value "\""
$data modify storage ssm: $(id).replaced_list append value "\""

#join
$execute store result storage ssm: $(id).child_id int 1 run random value 0..2147483646
$function ssm:dangerous/quote/join with storage ssm: $(id)

$scoreboard players reset $$(id) ssm_success
$scoreboard players reset $$(id) ssm_count