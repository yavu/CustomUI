#> custom_bar:renderer/calc/r2l
#
# 
#

# 満たされたバーの切り取り位置を算出
    scoreboard players operation %FilledStart CustomBar_Calc = %Length CustomBar_Calc
    scoreboard players operation %FilledStart CustomBar_Calc -= %BarPercentage CustomBar_Calc
    scoreboard players operation %FilledEnd CustomBar_Calc = %Length CustomBar_Calc

# 空のバーの切り取り位置を算出
    scoreboard players set %EmptyStart CustomBar_Calc 0
    scoreboard players operation %EmptyEnd CustomBar_Calc = %Length CustomBar_Calc
    scoreboard players operation %EmptyEnd CustomBar_Calc -= %BarPercentage CustomBar_Calc

# 補正
    scoreboard players add %DelimiterLength CustomBar_Calc 1
    scoreboard players operation %EmptyStart CustomBar_Calc *= %DelimiterLength CustomBar_Calc
    scoreboard players operation %EmptyEnd CustomBar_Calc *= %DelimiterLength CustomBar_Calc
    scoreboard players operation %FilledStart CustomBar_Calc *= %DelimiterLength CustomBar_Calc
    scoreboard players operation %FilledEnd CustomBar_Calc *= %DelimiterLength CustomBar_Calc
    scoreboard players remove %DelimiterLength CustomBar_Calc 1
    execute if score %BarPercentage CustomBar_Calc matches 0 run scoreboard players operation %EmptyEnd CustomBar_Calc -= %DelimiterLength CustomBar_Calc
    scoreboard players operation %FilledEnd CustomBar_Calc -= %DelimiterLength CustomBar_Calc
