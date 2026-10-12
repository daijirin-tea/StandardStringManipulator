data modify storage ssm: w.data.output set value {error:1b}

data modify storage ssm: w.output set from storage ssm: w.data.output
function ssm:save_frame_data
function ssm:reset_score