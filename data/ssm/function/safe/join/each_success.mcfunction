$data modify storage ssm: w.data.output set value "$(output)$(item)"
function ssm:safe/join/each