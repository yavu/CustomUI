#> custom_bar:renderer/
#
# レンダリング
#

# 引数を受け取る
    $data modify storage custom_bar: Arguments.FilledBaseText set value "$(FilledBaseText)"
    $data modify storage custom_bar: Arguments.EmptyBaseText set value "$(EmptyBaseText)"
    $scoreboard players set %Length CustomBar_Calc $(Length)
    $scoreboard players set %DelimiterLength CustomBar_Calc $(DelimiterLength)
    $scoreboard players operation %Value CustomBar_Calc = @s $(ScoreName)
    $scoreboard players set %MaxValue CustomBar_Calc $(MaxValue)
    $data modify storage custom_bar: Arguments.Reverse set value $(Reverse)
    $data modify storage custom_bar: Trim.Output set value $(Output)

# 目盛りの位置を算出
    scoreboard players operation %BarPercentage CustomBar_Calc = %Length CustomBar_Calc
    scoreboard players operation %BarPercentage CustomBar_Calc *= %Value CustomBar_Calc
    scoreboard players operation %BarPercentage CustomBar_Calc /= %MaxValue CustomBar_Calc
    execute if score %BarPercentage CustomBar_Calc matches ..-1 run scoreboard players set %BarPercentage CustomBar_Calc 0
    execute if score %BarPercentage CustomBar_Calc > %Length CustomBar_Calc run scoreboard players operation %BarPercentage CustomBar_Calc = %Length CustomBar_Calc

# 切り取り範囲の算出
    execute unless data storage custom_bar: Arguments{Reverse:true} run function custom_bar:renderer/calc/l2r
    execute if data storage custom_bar: Arguments{Reverse:true} run function custom_bar:renderer/calc/r2l

# ベース文字列からバーに必要な部分を切り取り返す
    execute store result storage custom_bar: Trim.FilledStart int 1 run scoreboard players get %FilledStart CustomBar_Calc
    execute store result storage custom_bar: Trim.FilledEnd int 1 run scoreboard players get %FilledEnd CustomBar_Calc
    execute store result storage custom_bar: Trim.EmptyStart int 1 run scoreboard players get %EmptyStart CustomBar_Calc
    execute store result storage custom_bar: Trim.EmptyEnd int 1 run scoreboard players get %EmptyEnd CustomBar_Calc
    execute unless data storage custom_bar: Arguments{Reverse:true} run function custom_bar:renderer/trim/l2r with storage custom_bar: Trim
    execute if data storage custom_bar: Arguments{Reverse:true} run function custom_bar:renderer/trim/r2l with storage custom_bar: Trim
