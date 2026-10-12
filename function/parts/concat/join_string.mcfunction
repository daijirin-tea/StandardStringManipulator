data remove storage ssm: w.data.input_copy[0][-1]
data remove storage ssm: w.data.input_copy[0][-1]
execute if data storage ssm: w.data{left:""} if data storage ssm: w.data{right:""} run return 1
$data modify storage ssm: w.data.input_copy[0] append value "$(left)$(right)"