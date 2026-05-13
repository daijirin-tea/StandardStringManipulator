$data modify storage ssm: $(id).list_a append value ""
$scoreboard players remove $$(id) ssm_count 1
$execute if score $$(id) ssm_count matches 1.. run function ssm:safe/to_dangerous/append_empty {id:$(id)}