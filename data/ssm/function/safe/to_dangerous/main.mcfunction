#> ssm:safe/to_dangerous/main
#
# safeな文字列をdangerousに変換します
#
# @input storage ssm: frames[-1].input: string - ("->%22, \->%5c, %->%25 にエンコード済み)
# @output storage ssm: frames[-1].output: string - ("や\も含まれる)

function ssm:set_frame_data
data modify storage ssm: w.data.input set from storage ssm: w.input

data modify storage ssm: w.data.output set value []
data modify storage ssm: w.data.element set value ""
data modify storage ssm: w.data.list_a set value []

execute store result storage ssm: w.data.start_index int 1 run scoreboard players set $ssm ssm_start_index 0
execute store result storage ssm: w.data.end_index int 1 run scoreboard players set $ssm ssm_end_index 1
execute store result storage ssm: w.data.end_index2 int 1 run scoreboard players set $ssm ssm_end_index2 3

scoreboard players set $ssm ssm_length 0

# ["abcd","\"","e","\\","f","%","g"]のようにする。ssm_lengthに長さを代入
function ssm:safe/to_dangerous/each with storage ssm: w.data
function ssm:safe/to_dangerous/add_element

execute store result storage ssm: w.data.ideal_length int 1 run scoreboard players set $ssm ssm_ideal_length 2

scoreboard players add $ssm ssm_join_count 1

# ideal_lengthが2^nになるかつ、ideal_length > lengthになるよう調整
function ssm:safe/to_dangerous/set_ideal_length with storage ssm: w.data

# 後ろに挿入する空文字の数
scoreboard players operation $ssm ssm_count = $ssm ssm_ideal_length
scoreboard players operation $ssm ssm_count -= $ssm ssm_length

execute if score $ssm ssm_count matches 1.. run function ssm:safe/to_dangerous/append_empty

# ["\"","a","\"",""]を["\\\\\\\"","a","\\\\\\\"",""]に変換
data modify storage ssm: w.data.list_a_copy set from storage ssm: w.data.list_a
data modify storage ssm: w.data.list_a set value []
function ssm:safe/to_dangerous/list_a_each

# list_aを2つずつjoinする
function ssm:safe/to_dangerous/list_a_join_all

data modify storage ssm: w.data.output set from storage ssm: w.data.list_a[0]

data modify storage ssm: w.output set from storage ssm: w.data.output
function ssm:save_frame_data
function ssm:reset_score