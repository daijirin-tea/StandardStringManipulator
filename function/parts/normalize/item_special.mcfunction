function ssm:save_frame
data modify storage ssm: temporary set from storage ssm: w
data modify storage ssm: w set value {}
data modify storage ssm: w.input set from storage ssm: temporary.data.item
data modify storage ssm: frames append from storage ssm: w
function ssm:parts/parse/main
data modify storage ssm: temporary set from storage ssm: w
data remove storage ssm: frames[-1]
function ssm:set_frame

data modify storage ssm: w.data.item_parts set from storage ssm: temporary.output