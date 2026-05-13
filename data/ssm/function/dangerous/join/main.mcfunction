#storage ssm: $(id).input ... string[] ("や\も含まれる)
#storage ssm: $(id).output ... string ("や\も含まれる)

#with storageを使用するとき用
$data modify storage ssm: $(id).id set value $(id)

#各要素をsafeに変更
$data modify storage ssm: $(id).safe_list set value []
$data modify storage ssm: $(id).input_copy set from storage ssm: $(id).input
$function ssm:dangerous/join/each {id:$(id)}

#safeの文字列を結合
$execute store result storage ssm: $(id).child_id int 1 run random value 0..2147483646
$function ssm:dangerous/join/join_safe with storage ssm: $(id)

#safeからdangerousに変更
$execute store result storage ssm: $(id).child_id int 1 run random value 0..2147483646
$function ssm:dangerous/join/convert_to_dangerous with storage ssm: $(id)

$scoreboard players reset $$(id) ssm_success