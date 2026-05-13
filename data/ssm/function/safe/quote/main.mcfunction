#storage ssm: $(id).input ... string ("->%22, \->%5c, %->%25 にエンコード済み)
#storage ssm: $(id).output ... string ("->%22, \->%5c, %->%25 にエンコード済み)

#with storageを使用するとき用
$data modify storage ssm: $(id).id set value $(id)

#split
$execute store result storage ssm: $(id).child_id int 1 run random value 0..2147483646
$function ssm:safe/quote/split with storage ssm: $(id)

#"%22" -> "%5c%22" , "%5c" -> "%5c%5c"
$data modify storage ssm: $(id).replaced_list set value []
$function ssm:safe/quote/each {id:$(id)}

$data modify storage ssm: $(id).replaced_list prepend value "%22"
$data modify storage ssm: $(id).replaced_list append value "%22"

#join
$execute store result storage ssm: $(id).child_id int 1 run random value 0..2147483646
$function ssm:safe/quote/join with storage ssm: $(id)

$scoreboard players reset $$(id) ssm_success
$scoreboard players reset $$(id) ssm_count