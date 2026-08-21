#> ssm:dangerous/to_safe/main
#
# dangerousな文字列をsafeに変換します
#
# @input storage ssm: frames[-1].input: string - ("や\も含まれる)
# @output storage ssm: frames[-1].output: string - ("->%22, \->%5c, %->%25 にエンコード済み)

function ssm:set_frame_data

data modify storage ssm: w.data.output set value ""

execute store result storage ssm: w.data.start_index int 1 run scoreboard players set $ssm ssm_start_index 0
execute store result storage ssm: w.data.end_index int 1 run scoreboard players set $ssm ssm_end_index 1

function ssm:dangerous/to_safe/each with storage ssm: w.data

data modify storage ssm: w.output set from storage ssm: w.data.output

function ssm:save_frame_data
function ssm:reset_score