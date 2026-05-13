$data modify storage ssm: $(child_id).input set from storage ssm: $(id).item

$function ssm:dangerous/to_safe/main {id:$(child_id)}

$data modify storage ssm: $(id).safe_list append from storage ssm: $(child_id).output

$function ssm:remove_data {id:$(child_id)}

$function ssm:dangerous/join/each {id:$(id)}