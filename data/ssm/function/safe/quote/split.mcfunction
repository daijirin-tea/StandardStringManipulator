$data modify storage ssm: $(child_id).input set from storage ssm: $(id).input

$function ssm:safe/split/main {id:$(child_id)}

$data modify storage ssm: $(id).split_list set from storage ssm: $(child_id).output

$function ssm:remove_data {id:$(child_id)}