#> debug:paint_test
#
# テスト表示
#

# スコアボード作成
    # scoreboard objectives add TestValue dummy

# テスト用数値
    scoreboard players add @s TestValue 1
    execute if score @s TestValue matches 130.. run scoreboard players set @s TestValue -30

# Barをレンダリング
    function custom_bar:renderer/ {\
        FilledBaseText: "#.#.#.#.#.#.#.#.#.#.#.#.#.#.#.#.#.#.#.#.#.#.#.#.#.#.#.#.#.#.#.#.#.#.#.#.#.#.#.#",\
        EmptyBaseText: "-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-",\
        Length: 40,\
        DelimiterLength: 1,\
        ScoreName: "TestValue",\
        MaxValue: 100,\
        Reverse: "false",\
        Output: "TestBar"\
    }

# Pieをレンダリング
    data modify storage variable_icon: Arguments set value {\
        FrameCount: 20,\
        ScoreName: "TestValue",\
        MaxValue: 100,\
        Output: "TestIcon"\
    }
    function variable_icon:renderer/ with storage variable_icon: Arguments

# プレイヤーに表示
    title @s actionbar [{"text": ""},{"nbt":"Return.TestBar","storage":"custom_bar:","font":"custom_bar/test","color":"#ffffff","interpret": true},{"text": "   "},{"nbt":"Return.TestIcon","storage":"variable_icon:","font":"variable_icon/pie","color":"#009EFF","interpret": true}]
