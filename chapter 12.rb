# 第12章 Rubyに関するその他のトピック
#
# ・日付や時刻の扱い
#
irb(main):166:0> time = Time.new(2017, 1, 31, 23, 30, 59)
=> 2017-01-31 23:30:59 +0900
# “+0900”はUTC（世界標準時）から9時間進んでいることを表す。
#
irb(main):167:0> require 'date'
=> true
irb(main):168:0> date = Date.new(2017, 1, 31)
=> #<Date: 2017-01-31 ((2457785j,0s,0n),+0s,2299161j)>
    irb(main):169:0> date = DateTime.new(2017, 1, 31, 23, 30, 59)
=> #<DateTime: 2017-01-31T23:30:59+00:00 ((2457785j,84659s,0n),+0s,2299161j)>
# “+00:00”は世界標準時と同じであることを表す。


# ・ファイルやディレクトリの扱い

# ・特定の形式のファイルを読み書きする

# ・環境変数や起動時引数の取得

# ・eval、バッククオートリテラル、sendメソッド
#
irb(main):175:0> code = '[1,2,3].map { |n| n*10 }'
=> "[1,2,3].map { |n| n*10 }"
irb(main):178:0> eval(code)
=> [10, 20, 30]

irb(main):179:0> str = 'a, b, c'
=> "a, b, c"
irb(main):180:0> str.send('upcase')
=> "A, B, C"
irb(main):181:0> str.send('split', ',')
=> ["a", " b", " c"]
#str.split(',')を呼ぶのと同じ

# ・Rake・gemとBundler
#
