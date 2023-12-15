#> custom_bar:renderer/trim/l2r
#
# バーに必要な部分を切り取る
#

# 初期化
    $data modify storage custom_bar: Return.$(Output) set value []

# 切り取って配列に入れる
    $data modify storage custom_bar: Return.$(Output) append string storage custom_bar: Arguments.FilledBaseText $(FilledStart) $(FilledEnd)
    $data modify storage custom_bar: Return.$(Output) append string storage custom_bar: Arguments.EmptyBaseText $(EmptyStart) $(EmptyEnd)
