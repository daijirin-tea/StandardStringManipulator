data modify storage ssm: w.data.output set value []
execute unless data storage ssm: w.data{input:""} run data modify storage ssm: w.data.output append from storage ssm: w.data.input

data modify storage ssm: w.output set from storage ssm: w.data.output
function ssm:save_frame_data
function ssm:reset_score