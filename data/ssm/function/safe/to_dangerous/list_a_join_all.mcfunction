$data modify storage ssm: $(id).list_a_copy set from storage ssm: $(id).list_a
$data modify storage ssm: $(id).list_a set value []
$function ssm:safe/to_dangerous/list_a_join {id:$(id)}

$execute store success score $$(id) ssm_success run data get storage ssm: $(id).list_a[1]
$execute if score $$(id) ssm_success matches 1 run function ssm:safe/to_dangerous/list_a_join_all {id:$(id)}