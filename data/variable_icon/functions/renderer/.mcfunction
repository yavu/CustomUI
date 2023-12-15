#> variable_icon:renderer/
#
# レンダリング
#

# 引数
    execute store result score %FrameCount VariableIcon_Calc run data get storage variable_icon: Arguments.FrameCount 1
$scoreboard players operation %Value VariableIcon_Calc = @s $(ScoreName)
    execute store result score %MaxValue VariableIcon_Calc run data get storage variable_icon: Arguments.MaxValue 1
    execute if score %MaxValue VariableIcon_Calc matches 0 run scoreboard players operation %MaxValue VariableIcon_Calc = %FrameCount VariableIcon_Calc
    data modify storage variable_icon: Conversion.Output set from storage variable_icon: Arguments.Output

# フレームを算出
    scoreboard players operation %Frame VariableIcon_Calc = %FrameCount VariableIcon_Calc
    scoreboard players operation %Frame VariableIcon_Calc *= %Value VariableIcon_Calc
    scoreboard players operation %Frame VariableIcon_Calc /= %MaxValue VariableIcon_Calc
    execute if score %Frame VariableIcon_Calc matches ..-1 run scoreboard players set %Frame VariableIcon_Calc 0
    execute if score %Frame VariableIcon_Calc > %FrameCount VariableIcon_Calc run scoreboard players operation %Frame VariableIcon_Calc = %FrameCount VariableIcon_Calc

# ゼロパディング
    execute if score %Frame VariableIcon_Calc matches ..9 run data modify storage variable_icon: Conversion.ZeroPadding set value "000"
    execute if score %Frame VariableIcon_Calc matches 10..99 run data modify storage variable_icon: Conversion.ZeroPadding set value "00"
    execute if score %Frame VariableIcon_Calc matches 100..999 run data modify storage variable_icon: Conversion.ZeroPadding set value "0"
    execute if score %Frame VariableIcon_Calc matches 1000.. run data modify storage variable_icon: Conversion.ZeroPadding set value ""

# unicodeの形に変換
    execute store result storage variable_icon: Conversion.Frame int 1 run scoreboard players get %Frame VariableIcon_Calc
    execute if data storage variable_icon: Conversion{Frame:0} run data modify storage variable_icon: Conversion.Frame set value "F"
    function variable_icon:renderer/conversion with storage variable_icon: Conversion

# 引数のストレージをリセット
    data remove storage variable_icon: Arguments
