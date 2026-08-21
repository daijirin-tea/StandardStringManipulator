#> ssm:safe/join/main
#
# safeな文字列を結合します
#
# @input storage ssm: frames[-1].input: string[] - ("->%22, \->%5c, %->%25 にエンコード済み)
# @output storage ssm: frames[-1].output: string - ("->%22, \->%5c, %->%25 にエンコード済み)

function ssm:set_frame_data
data modify storage ssm: w.data.input set from storage ssm: w.input

data modify storage ssm: w.data.output set value ""

data modify storage ssm: w.data.input_copy set from storage ssm: w.data.input
function ssm:safe/join/each

data modify storage ssm: w.output set from storage ssm: w.data.output
function ssm:save_frame_data
function ssm:reset_score