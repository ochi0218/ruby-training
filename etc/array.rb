# 配列

names = ["ochi", "hoge1", "foo1"]
p names

p names[0]
p names[1..2] # 範囲を指定して取り出せる
p names[0...2] # 最後の列を含まない
p names[-1] # 後ろから列挙する

names2 = ["foo1", "foo2", "foo3"]

p names2

names2[0..1] = ["new_foo1", "new_foo2"]

p names2

names2[1,2] = ["new_new_foo2", "new_new_foo3"] # 1番目から2個ぶんの要素を置き換える

p names2

names2[1,0] = ["new_new_new_foo", "new_new_new_foo2"] # 1番目から0個ぶんの要素を置き換える(要素を増やす)

p names2

