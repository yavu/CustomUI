#> custom_bar:renderer/calc/l2r
#
# 切り取り範囲の算出
#

# 満たされたバーの切り取り位置を算出
    scoreboard players set %FilledStart CustomBar_Calc 0
    scoreboard players operation %FilledEnd CustomBar_Calc = %BarPercentage CustomBar_Calc

# 空のバーの切り取り位置を算出
    scoreboard players operation %EmptyStart CustomBar_Calc = %BarPercentage CustomBar_Calc
    scoreboard players operation %EmptyEnd CustomBar_Calc = %Length CustomBar_Calc

# 補正
    scoreboard players add %DelimiterLength CustomBar_Calc 1
    scoreboard players operation %FilledStart CustomBar_Calc *= %DelimiterLength CustomBar_Calc
    scoreboard players operation %FilledEnd CustomBar_Calc *= %DelimiterLength CustomBar_Calc
    scoreboard players operation %EmptyStart CustomBar_Calc *= %DelimiterLength CustomBar_Calc
    scoreboard players operation %EmptyEnd CustomBar_Calc *= %DelimiterLength CustomBar_Calc
    scoreboard players remove %DelimiterLength CustomBar_Calc 1
    execute if score %Length CustomBar_Calc = %BarPercentage CustomBar_Calc run scoreboard players operation %FilledEnd CustomBar_Calc -= %DelimiterLength CustomBar_Calc
    scoreboard players operation %EmptyEnd CustomBar_Calc -= %DelimiterLength CustomBar_Calc
