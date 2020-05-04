# 4章　配列や繰り返し処理を理解する
# -------------------------------------
# 4.2 配列
irb(main):035:0> a = [
irb(main):036:1* 1,
irb(main):037:1* 2,
irb(main):038:1* 3,
irb(main):039:1* ]
=> [1, 2, 3]
# 最後の要素に,ついてもエラーにはならない
irb(main):040:0> a = [
irb(main):041:1* 1,
irb(main):042:1* 2,
irb(main):043:1* 3,
irb(main):044:1* ]
=> [1, 2, 3]
# 文字と数字を混在することもできる
irb(main):045:0> a = ['apple', 2, 'orange', 3, 'melon']
=> ["apple", 2, "orange", 3, "melon"]
irb(main):046:0> a = [[10,20,30], [40,50,60], [70,80,90]]
=> [[10, 20, 30], [40, 50, 60], [70, 80, 90]]
irb(main):047:0> a = [1, 2, 3]
=> [1, 2, 3]
irb(main):048:0> a[0]
=> 1
irb(main):049:0> a[1]
=> 2
irb(main):050:0> a[2]
=> 3
# 存在しないものを指定してもエラーにならずnilが返る
irb(main):051:0> a = [1, 2, 3]
=> [1, 2, 3]
irb(main):052:0> a[100]
=> nil
irb(main):053:0> a = [1, 2, 3]
=> [1, 2, 3]
irb(main):054:0> a.size
=> 3
irb(main):055:0> a.length
=> 3
# 配列の変更・追加・削除
irb(main):056:0> a = [1,2,3]
=> [1, 2, 3]
irb(main):057:0> a[1] = 20
=> 20
irb(main):058:0> a
=> [1, 20, 3]
irb(main):059:0> a = [1,2,3]
=> [1, 2, 3]
irb(main):060:0> a[4] = 50
=> 50
irb(main):061:0> a
=> [1, 2, 3, nil, 50]
irb(main):062:0> a = []
=> []
irb(main):063:0> a << 1
=> [1]
irb(main):064:0> a << 2
=> [1, 2]
irb(main):065:0> a << 3
=> [1, 2, 3]
irb(main):066:0> a
=> [1, 2, 3]
irb(main):067:0> a = [1,2,3]
=> [1, 2, 3]
# delete_at は指定したindexの値を削除(deleteと違うよ)
irb(main):068:0> a.delete_at(1)
=> 2
irb(main):069:0> a
=> [1, 3]
# 配列を使った多重代入
irb(main):070:0> a, b = 1, 2
=> [1, 2]
irb(main):071:0> a
=> 1
irb(main):072:0> b
=> 2
irb(main):073:0> a, b = [1, 2]
=> [1, 2]
irb(main):074:0> a
=> 1
irb(main):075:0> b
=> 2
irb(main):076:0> c, d = [10]
=> [10]
irb(main):077:0> c
=> 10
irb(main):078:0> d
=> nil
irb(main):079:0> e, f = [100, 200, 300]
=> [100, 200, 300]
irb(main):080:0> e
=> 100
irb(main):081:0> f
=> 200
# divmodメソッド：商と余りを配列にして返す
irb(main):001:0>
irb(main):001:0> 14.divmod(3)
=> [4, 2]
irb(main):002:0> quo_rem = 14.divmod(3)
=> [4, 2]
irb(main):003:0> quo_rem[0]
=> 4
irb(main):004:0> quo_rem[1]
=> 2
irb(main):005:0> quotient, remainder = 14.divmod(3)
=> [4, 2]
irb(main):006:0> "商=#{quotient}, 余り=#{remainder}"
=> "商=4, 余り=2"
irb(main):008:0> numbers = [1,2,3,4]
=> [1, 2, 3, 4]
irb(main):009:0> sum = 0
=> 0
irb(main):010:0> numbers.each do |n|
irb(main):011:1*  sum += n
irb(main):012:1> end
=> [1, 2, 3, 4]
irb(main):013:0> sum
=> 10
irb(main):014:0> a = [1,2,3,1,2,3]
=> [1, 2, 3, 1, 2, 3]
# delete: 値が２のものを削除。index番号でないよ
irb(main):015:0> a.delete(2)
=> 2
irb(main):016:0> a
=> [1, 3, 1, 3]
irb(main):017:0> a = [1,2,3,1,2,3]
=> [1, 2, 3, 1, 2, 3]

# 奇数の時だけ削除
irb(main):021:0> a.delete_if do |n|
irb(main):022:1*  n.odd?
irb(main):023:1> end
=> [2, 2]

# 4.3 ブロック引数とブロック内の変数
# ----------------------------------------
# ブロック引数の値をブロック外の変数と同じにした時はブロック内部の引数が優先される
irb(main):024:0> numbers = [1,2,3,4]
=> [1, 2, 3, 4]
irb(main):025:0> sum = 0
=> 0
irb(main):026:0> numbers.each do |n|
irb(main):027:1*  sum += n
irb(main):028:1> end
=> [1, 2, 3, 4]
irb(main):029:0> numbers.each do |i|
irb(main):030:1*  sum += i
irb(main):031:1> end
=> [1, 2, 3, 4]
irb(main):035:0> numbers.each do |numbers|
irb(main):036:1*  sum += numbers
irb(main):037:1> end
=> [1, 2, 3, 4]
irb(main):038:0> numbers.each do
irb(main):039:1*  sum += 1
irb(main):040:1> end
=> [1, 2, 3, 4]

# doとend
irb(main):053:0> numbers = [1,2,3,4]
=> [1, 2, 3, 4]
irb(main):054:0> sum = 0
=> 0
irb(main):055:0> numbers.each do |n| sum += n end
=> [1, 2, 3, 4]
irb(main):056:0> sum
=> 10
irb(main):058:0> numbers.each { |n| sum += n }
=> [1, 2, 3, 4]
irb(main):059:0> sum
=> 20
irb(main):060:0> numbers = [1,2,3,4]
=> [1, 2, 3, 4]
irb(main):061:0> sum = 0
=> 0
irb(main):062:0> numbers.each { |n|
irb(main):063:1*  sum += n
irb(main):064:1> }
=> [1, 2, 3, 4]
irb(main):065:0> sum
=> 10
irb(main):066:0> numbers = [1,2,3,4,5]
=> [1, 2, 3, 4, 5]
irb(main):067:0> new_numbers = []
=> []
irb(main):068:0> numbers.each { |n| new_numbers << n*10 }
=> [1, 2, 3, 4, 5]

# 4.4 ブロックを使う配列のメソッド
# -------------------------------------------------------
irb(main):069:0> numbers = [1,2,3,4,5]
=> [1, 2, 3, 4, 5]
irb(main):070:0> new_numbers = numbers.map { |n| n*10 }
=> [10, 20, 30, 40, 50]
irb(main):071:0> numbers = [1,2,3,4,5,6]
=> [1, 2, 3, 4, 5, 6]
irb(main):072:0> even_numbers = numbers.select { |n| n.even? }
=> [2, 4, 6]
irb(main):073:0> numbers = [1,2,3,4,5,6]
=> [1, 2, 3, 4, 5, 6]
irb(main):074:0> non_multiples_of_three = numbers.reject { |n| n % 3 == 0 }
=> [1, 2, 4, 5]
irb(main):075:0> numbers = [1,2,3,4,5,6]
=> [1, 2, 3, 4, 5, 6]
irb(main):076:0> even_number = numbers.find { |n| n.even? }
=> 2
numbers = [1,2,3,4]
=> [1, 2, 3, 4]
irb(main):078:0> sum = 0
=> 0
irb(main):079:0> numbers.each { |n| sum += n }
=> [1, 2, 3, 4]
irb(main):080:0> numbers = [1,2,3,4]
=> [1, 2, 3, 4]

# inject メソッド　たたみこみ演算
irb(main):081:0> sum = numbers.inject(0) { |result, n| result + n }
=> 10
irb(main):082:0> ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'].inject('Sun') { |result, s| result + s }
=> "SunMonTueWedThuFriSat"

# &: での省略
irb(main):085:0> ['ruby', 'java', 'perl'].map(&:upcase)
=> ["RUBY", "JAVA", "PERL"]
irb(main):086:0> [1,2,3,4,5,6].select { |n| n.odd? }
=> [1, 3, 5]
irb(main):087:0> [1,2,3,4,5,6].select(&:odd?)
=> [1, 3, 5]

# 4.5 範囲
# --------------------------------------------------------
irb(main):088:0> (1..5).class
=> Range
irb(main):089:0> (1...5).class
=> Range
# 1..5 は 1も5も範囲に含まれる
irb(main):090:0> range = 1..5
=> 1..5
irb(main):091:0> range.include?(0)
=> false
irb(main):092:0> range.include?(1)
=> true
irb(main):093:0> range.include?(4.9)
=> true
irb(main):094:0> range.include?(5)
=> true
irb(main):095:0> range.include?(6)
=> false
# 1...5 だと最後の5は範囲に含まれなくなる
irb(main):096:0> range = 1...5
=> 1...5
irb(main):097:0> range.include?(0)
=> false
irb(main):098:0> range.include?(1)
=> true
irb(main):099:0> range.include?(4.9)
=> true
irb(main):100:0> range.include?(5)
=> false
# 囲んであげる()
irb(main):100:0> (1..5).include?(1)
=> true

# ~以上、~未満
irb(main):113:0> def liquid?(temperature)
irb(main):114:1>  0 <= temperature && temperature < 100
irb(main):115:1> end
=> :liquid?
irb(main):116:0> liquid?(-1)
=> false
irb(main):117:0> liquid?(0)
=> true
irb(main):118:0> liquid?(99)
=> true
irb(main):119:0> liquid?(100)
=> false
irb(main):120:0> def charge(age)
irb(main):121:1>  case age
irb(main):122:2>  when 0..5
irb(main):123:2>   0
irb(main):124:2>  when 6..12
irb(main):125:2>   300
irb(main):126:2>  when 13..18
irb(main):127:2>   600
irb(main):128:2>  else
irb(main):129:2>   1000
irb(main):130:2>  end
irb(main):131:1> end
=> :charge
irb(main):132:0> charge(3)
=> 0
irb(main):133:0> charge(12)
=> 300
irb(main):134:0> charge(16)
=> 600
irb(main):135:0> charge(25)
=> 1000

# 値が連続する配列
irb(main):136:0> (1..5).to_a
=> [1, 2, 3, 4, 5]
irb(main):137:0> (1...5).to_a
=> [1, 2, 3, 4]
irb(main):138:0> ('a'..'e').to_a
=> ["a", "b", "c", "d", "e"]
irb(main):139:0> ('a'...'e').to_a
=> ["a", "b", "c", "d"]
irb(main):140:0> ('bad'...'bag').to_a
=> ["bad", "bae", "baf"]
irb(main):141:0> ('bad'..'bag').to_a
=> ["bad", "bae", "baf", "bag"]

# [* ]としても配列作ってくれる
irb(main):142:0> [*1..5]
=> [1, 2, 3, 4, 5]
irb(main):143:0> [*1...5]
=> [1, 2, 3, 4]

# stepを使うと２つ飛ばしで繰り返し処理を行う
irb(main):152:0> (1..10).step(2) { |n| numbers << n }
=> [1,3,5,7]