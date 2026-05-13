$data modify storage ssm: $(id).output set value "$(output)$(item)"
$function ssm:safe/join/each {id:$(id)}