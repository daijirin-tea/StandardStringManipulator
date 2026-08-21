#> ssm:safe/quote/main
#
# safeな文字列をダブルクォーテーションで囲い、中にあるダブルクォーテーションはエスケープして返します
#
# @input storage ssm: frames[-1].input: string - ("->%22, \->%5c, %->%25 にエンコード済み)
# @output storage ssm: frames[-1].output: string - ("->%22, \->%5c, %->%25 にエンコード済み)

function ssm:set_frame_data
data modify storage ssm: w.data.input set from storage ssm: w.input

# split
function ssm:safe/quote/split

# "%22" -> "%5c%22" , "%5c" -> "%5c%5c"
data modify storage ssm: w.data.replaced_list set value []
function ssm:safe/quote/each

data modify storage ssm: w.data.replaced_list prepend value "%22"
data modify storage ssm: w.data.replaced_list append value "%22"

# join
function ssm:safe/quote/join

data modify storage ssm: w.output set from storage ssm: w.data.output
function ssm:save_frame_data
function ssm:reset_score