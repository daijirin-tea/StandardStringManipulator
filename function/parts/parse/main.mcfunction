#> ssm:parts/parse/main
#
# 文字列を解釈し、StringPartsに変換します
#
# type StringParts = (string | {type: "backslash" | "double_quotation"})[]
# @input storage ssm: frames[-1].input: string
# @output storage ssm: frames[-1].output: StringParts

function ssm:set_frame_data
data modify storage ssm: w.data.input set from storage ssm: w.input

scoreboard players set $ssm ssm_success 0
function ssm:parts/parse/check with storage ssm: w.data
execute if score $ssm ssm_success matches 0 run return run function ssm:parts/parse/special
execute store success score $ssm ssm_success run data modify storage ssm: w.data.assigned_input set from storage ssm: w.data.input
execute if score $ssm ssm_success matches 1 run return run function ssm:parts/parse/special
function ssm:parts/parse/plain