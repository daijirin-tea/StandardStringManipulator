#> ssm:parts/stringify/main
#
# StringPartsを文字列に変換します
#
# @input storage ssm: frames[-1].input: StringParts
# @output storage ssm: frames[-1].output: string

function ssm:set_frame_data
data modify storage ssm: w.data.input set from storage ssm: w.input

data modify storage ssm: w.data.input_copy set from storage ssm: w.data.input
execute store result score $ssm ssm_length if data storage ssm: w.data.input_copy[]
scoreboard players set $ssm ssm_ideal_length 1
scoreboard players set $ssm ssm_join_count 0
execute if score $ssm ssm_ideal_length < $ssm ssm_length run function ssm:parts/stringify/set_ideal_length

execute if score $ssm ssm_ideal_length > $ssm ssm_length run function ssm:parts/stringify/append_empty

data modify storage ssm: w.data.backslash set value "\\"
data modify storage ssm: w.data.double_quotation set value "\""
data modify storage ssm: w.data.backslash_backslash set value "\\"
data modify storage ssm: w.data.double_quotation_backslash set value "\\"
execute if score $ssm ssm_join_count matches 1.. run function ssm:parts/stringify/set_special_letter

data modify storage ssm: w.data.list_a set value []
function ssm:parts/stringify/each

execute if data storage ssm: w.data.list_a[1] run function ssm:parts/stringify/join

data modify storage ssm: w.data.output set from storage ssm: w.data.list_a[0]

data modify storage ssm: w.output set from storage ssm: w.data.output
function ssm:save_frame_data
function ssm:reset_score