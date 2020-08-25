# 11章　バックトレースとよくある例外クラスとその原因
#
# NameError
#
# 未定義のローカル変数や定数、privateメソッドなどを呼び出したときに発生。
# 単純なタイプミスであることが多いが、外部ファイルや外部ライブラリのrequireを忘れている場合にも発生することがある。
#
#　NoMethodError
#
# その名のとおり、存在しないメソッドを呼び出そうとした場合に発生します。
# たとえば以下のような場合。
#
# ・単純にメソッド名を打ち間違えた。
# ・レシーバが想定していた型と異なる（文字列ではなくシンボルになっていた場合など）。
# ・レシーバが想定に反してnilになっている。
#
# とくに3つめのレシーバがnilになっているケースは非常によく発生。
# 本来nilになるべきでない変数がnilになっている場合に発生するのはもちろん、インスタンス変数のタイプミスでも容易に同じ問題が発生

# TypeError
#
# TypeErrorは期待しない型（クラス）がメソッドの引数に渡されたときに発生


# ArgumentError
#
# ArgumentErrorは引数（argument）の数が違ったり、期待する値ではなかったりした場合に発生


# ZeroDivisionError
#
# ZeroDivisionErrorは整数を0で除算（割り算）しようとしたときに発生


# SystemStackError
#
# システムスタックが溢れたときに発生。とくに間違ってメソッドを再帰呼び出しした場合に発生。
# 以下は間違ってメソッドを再帰呼び出ししたために、無限ループしてしまうコード例
#
irb(main):164:0> user = User.new
=> #<User:0x00007fcd050eae78>
irb(main):165:0> user.name
Traceback (most recent call last):
    16: from (irb):161:in `name'
       15: from (irb):161:in `name'
       14: from (irb):161:in `name'
13: from (irb):161:in `name'
       12: from (irb):161:in `name'
       11: from (irb):161:in `name'
10: from (irb):161:in `name'
        9: from (irb):161:in `name'
        8: from (irb):161:in `name'
7: from (irb):161:in `name'
        6: from (irb):161:in `name'
        5: from (irb):161:in `name'
4: from (irb):161:in `name'
        3: from (irb):161:in `name'
        2: from (irb):161:in `name'
1: from (irb):161:in 'name'
SystemStackError (stack level too deep)

# LoadError
#
# requireやloadの実行に失敗したときに発生。
# ・requireしたいファイルのパスやライブラリ名が間違っている。
# ・requireしたgemが実行環境にインストールされていない。

# SyntaxError
#
# 構文エラー。たいていの場合、プログラムの起動自体に失敗する。
# このエラーが発生したときはendやカンマの数に過不足がある、丸括弧や中括弧がちゃんと閉じられていない、といった原因が考えられる。
#
