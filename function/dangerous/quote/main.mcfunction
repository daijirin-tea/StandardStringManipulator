#> ssm:dangerous/quote/main
#
# dangerousな文字列をダブルクォーテーションで囲い、中にあるダブルクォーテーションはエスケープして返します
#
# @input storage ssm: frames[-1].input: string - ("や\も含まれる)
# @output storage ssm: frames[-1].output: string - ("や\も含まれる)

function ssm:set_frame_data
data modify storage ssm: w.data.input set from storage ssm: w.input

# split
function ssm:dangerous/quote/split

# "\""" -> "\\\"" , "\\" -> "\\\\"
data modify storage ssm: w.data.replaced_list set value []
function ssm:dangerous/quote/each

data modify storage ssm: w.data.replaced_list prepend value "\""
data modify storage ssm: w.data.replaced_list append value "\""

# join
function ssm:dangerous/quote/join

data modify storage ssm: w.output set from storage ssm: w.data.output
function ssm:save_frame_data
function ssm:reset_score