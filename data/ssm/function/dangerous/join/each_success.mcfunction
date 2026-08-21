function ssm:save_frame

data modify storage ssm: temporary set from storage ssm: w

data remove storage ssm: w
data modify storage ssm: w.input set from storage ssm: temporary.data.item

data modify storage ssm: frames append from storage ssm: w
function ssm:dangerous/to_safe/main

data modify storage ssm: temporary.data.output set from storage ssm: w.output
data remove storage ssm: frames[-1]
function ssm:set_frame

data modify storage ssm: w.data.safe_list append from storage ssm: temporary.data.output

function ssm:dangerous/join/each