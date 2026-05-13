#storage ssm: $(id).input ... string[] ("->%22, \->%5c, %->%25 にエンコード済み)
#storage ssm: $(id).output ... string ("->%22, \->%5c, %->%25 にエンコード済み)

#with storageを使用するとき用
$data modify storage ssm: $(id).id set value $(id)

$data modify storage ssm: $(id).output set value ""

$data modify storage ssm: $(id).input_copy set from storage ssm: $(id).input
$function ssm:safe/join/each {id:$(id)}

$scoreboard players reset $$(id) ssm_success