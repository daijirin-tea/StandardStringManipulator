$data modify storage ssm: $(id).list_a append value "$(left)$(right)"

$function ssm:safe/to_dangerous/list_a_join {id:$(id)}