#> ssm:dangerous/join/main
#
# dangerousな文字列を結合します
#
# @input storage ssm: frames[-1].input: string[] - ("や\も含まれる)
# @output storage ssm: frames[-1].output: string - ("や\も含まれる)

function ssm:set_frame_data
data modify storage ssm: w.data.input set from storage ssm: w.input

# 各要素をsafeに変更
data modify storage ssm: w.data.safe_list set value []
data modify storage ssm: w.data.input_copy set from storage ssm: w.data.input
function ssm:dangerous/join/each

# safeの文字列を結合
function ssm:dangerous/join/join_safe

# safeからdangerousに変換
function ssm:dangerous/join/convert_to_dangerous

data modify storage ssm: w.output set from storage ssm: w.data.output
function ssm:save_frame_data
function ssm:reset_score