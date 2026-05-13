$data modify storage ssm: $(child_id).input set from storage ssm: $(id).replaced_list

$function ssm:dangerous/join/main {id:$(child_id)}

$data modify storage ssm: $(id).output set from storage ssm: $(child_id).output

$function ssm:remove_data {id:$(child_id)}