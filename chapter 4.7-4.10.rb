# 4.7 配列をもっと詳しく
# -------------------------------------
# 配列[位置, 取得する長さ]
irb(main):155:0> a = [1,2,3,4,5]
=> [1, 2, 3, 4, 5]
irb(main):156:0> a[1,3]
=> [2, 3, 4]
irb(main):157:0> a = [1,2,3,4,5]
=> [1, 2, 3, 4, 5]

# values_atを使えば、位置を複数指定できる
irb(main):158:0> a.values_at(0, 2, 4)
=> [1, 3, 5]
irb(main):159:0> a = [1, 2, 3]
=> [1, 2, 3]
irb(main):160:0> a[a.size - 1]
=> 3
irb(main):161:0> a.size
=> 3
irb(main):162:0> a = [1, 2, 3]
=> [1, 2, 3]

# [-1]は最後
irb(main):163:0> a[-1]
=> 3
irb(main):164:0> a[-2]
=> 2
irb(main):165:0> a[-2,2]
=> [2, 3]
irb(main):166:0> a = [1, 2, 3]
=> [1, 2, 3]
irb(main):167:0> a.last
=> 3
irb(main):168:0> a.last(2)
=> [2, 3]
irb(main):169:0> a = [1, 2, 3]
=> [1, 2, 3]
irb(main):170:0> a.first
=> 1
irb(main):171:0> a.first(2)
=> [1, 2]
irb(main):172:0> a = [1, 2, 3]
=> [1, 2, 3]
irb(main):173:0> a[-3] = -10
=> -10
irb(main):174:0> a
=> [-10, 2, 3]

# a[1, 3]で　1から連続3つを100に置き換える
irb(main):178:0> a = [1,2,3,4,5]
=> [1, 2, 3, 4, 5]
irb(main):179:0> a[1, 3] = 100
=> 100
irb(main):180:0> a
=> [1, 100, 5]
irb(main):181:0> a = []
=> []
irb(main):182:0> a.push(1)
=> [1]
irb(main):183:0> a.push(2, 3)
=> [1, 2, 3]

# delete(2)で値が2である要素を削除
irb(main):184:0> a = [1,2,3,1,2,3]
=> [1, 2, 3, 1, 2, 3]
irb(main):185:0> a.delete(2)
=> 2
irb(main):186:0> a
=> [1, 3, 1, 3]
irb(main):187:0> a.delete(5)
=> nil

irb(main):188:0> a =[1]
=> [1]
irb(main):189:0> b = [2, 3]
=> [2, 3]
irb(main):190:0> a.concat(b)
=> [1, 2, 3]
irb(main):191:0> a
=> [1, 2, 3]
irb(main):192:0> b
=> [2, 3]
irb(main):193:0> a = [1]
=> [1]
irb(main):194:0> b = [2, 3]
=> [2, 3]
irb(main):195:0> a + b
=> [1, 2, 3]
irb(main):196:0> a
=> [1]
irb(main):197:0> b
=> [2, 3]
irb(main):198:0> a = [1, 2, 3]
=> [1, 2, 3]
irb(main):199:0> b = [3, 4, 5]
=> [3, 4, 5]
# 和集合
irb(main):200:0> a | b
=> [1, 2, 3, 4, 5]
# 差集合
irb(main):201:0> a - b
=> [1, 2]
# 積集合
irb(main):202:0> a & b
=> [3]

irb(main):203:0> require 'set'
=> false
# より効率的に集合を扱えるSetクラス
irb(main):204:0> a = Set.new([1,2,3])
=> #<Set: {1, 2, 3}>
irb(main):205:0> b = Set.new([3,4,5])
=> #<Set: {3, 4, 5}>
irb(main):206:0> a | b
=> #<Set: {1, 2, 3, 4, 5}>
irb(main):207:0> a - b
=> #<Set: {1, 2}>
irb(main):208:0> a & b
=> #<Set: {3}>


irb(main):209:0> e, f = 100, 200, 300
=> [100, 200, 300]
irb(main):210:0> e
=> 100
irb(main):211:0> f
=> 200
# * をつけると後ろ残り全部含めてくれる
irb(main):212:0> e, *f = 100, 200, 300
=> [100, 200, 300]
irb(main):213:0> e
=> 100
irb(main):214:0> f
=> [200, 300]

irb(main):215:0> a = []
=> []
irb(main):216:0> a.push(1)
=> [1]
irb(main):217:0> a.push(2, 3)
=> [1, 2, 3]
irb(main):218:0> a = []
=> []
irb(main):219:0> b = [2,3]
=> [2, 3]
irb(main):220:0> a.push(1)
=> [1]
irb(main):221:0> a.push(b)
=> [1, [2, 3]]
irb(main):222:0> a = []
=> []
irb(main):223:0> b = [2, 3]
=> [2, 3]
irb(main):224:0> a.push(1)
=> [1]
# *をつけると展開して追加してくれる
irb(main):225:0> a.push(*b)
=> [1, 2, 3]

# メソッドの可変長引数
irb(main):226:0> def greeting(*names)
irb(main):227:1>  "#{names.join('と')}、こんにちは"
irb(main):228:1> end
=> :greeting
irb(main):229:0> greeting("田中さん")
=> "田中さん、こんにちは"
irb(main):230:0> greeting("田中さん", "鈴木さん")
=> "田中さんと鈴木さん、こんにちは"
irb(main):231:0> greeting("田中さん", "鈴木さん", "佐藤さん")
=> "田中さんと鈴木さんと佐藤さん、こんにちは"

irb(main):232:0> a = [1,2,3]
=> [1, 2, 3]
irb(main):233:0> [a]
=> [[1, 2, 3]]
irb(main):234:0> [*a]
=> [1, 2, 3]
irb(main):235:0> a = [1, 2, 3]
=> [1, 2, 3]
irb(main):236:0> [-1, 0] + a + [4, 5]
=> [-1, 0, 1, 2, 3, 4, 5]
irb(main):238:0> a = [1,2,3]
=> [1, 2, 3]
irb(main):239:0> [-1, 0, *a, 4, 5]
=> [-1, 0, 1, 2, 3, 4, 5]
irb(main):240:0> [1, 2, 3] == [1, 2, 3]
=> true
irb(main):241:0> [1, 2, 3] == [1, 2, 4]
=> false
irb(main):242:0> [1, 2, 3] == [1, 2]
=> false
irb(main):243:0> [1, 2, 3] == [1, 2, 3, 4]
=> false
irb(main):244:0> %w!apple melom orange!
=> ["apple", "melom", "orange"]
irb(main):245:0> %w(apple melom orange)
=> ["apple", "melom", "orange"]
irb(main):246:0> %w(
irb(main):247:0] apple
irb(main):248:0] melon
irb(main):249:0] orange
irb(main):250:0] )

# スペースが欲しい時には\ をいれる
=> ["apple", "melon", "orange"]
irb(main):251:0> %w(big\ apple small\ meron orange)
=> ["big apple", "small meron", "orange"]

irb(main):254:0> 'Ruby'.chars
=> ["R", "u", "b", "y"]
irb(main):255:0> 'Ruby,Java,Perl,PHP'.split(',')
=> ["Ruby", "Java", "Perl", "PHP"]
irb(main):256:0> a = Array.new
=> []
irb(main):257:0> a = Array.new(5)
=> [nil, nil, nil, nil, nil]
irb(main):258:0> a = Array.new(5, 0)
=> [0, 0, 0, 0, 0]

# 第二引数を使って初期値をしている時の注意
irb(main):259:0> a = Array.new(5, 'default')
=> ["default", "default", "default", "default", "default"]
irb(main):260:0> str = a[0]
=> "default"
irb(main):261:0> str.upcase!
=> "DEFAULT"
irb(main):262:0> a
=> ["DEFAULT", "DEFAULT", "DEFAULT", "DEFAULT", "DEFAULT"]

# 4.8 ブロックについてもっと詳しく
# -----------------------------------
irb(main):263:0> fruits = ['apple', 'orange', 'melon']
=> ["apple", "orange", "melon"]
irb(main):264:0> fruits.each_with_index { |fruit, i| puts "#{i}: #{fruit}" }
0: apple
1: orange
2: melon
=> ["apple", "orange", "melon"]
irb(main):265:0> fruits = ['apple', 'orange', 'melon']
=> ["apple", "orange", "melon"]
irb(main):268:0> fruits = ['apple', 'orange', 'melon']
=> ["apple", "orange", "melon"]
irb(main):269:0> fruits.each
=> #<Enumerator: ["apple", "orange", "melon"]:each>
irb(main):270:0> fruits.map
=> #<Enumerator: ["apple", "orange", "melon"]:map>
irb(main):272:0> fruits.delete_if
=> #<Enumerator: ["apple", "orange", "melon"]:delete_if>

# 添え字を0以外の数値から開始させる
irb(main):273:0> fruits = ['apple', 'orange', 'melon']
=> ["apple", "orange", "melon"]
irb(main):274:0> fruits.each.with_index(1) { |fruit, i| puts "#{i}: #{fruit}" }
1: apple
2: orange
3: melon
=> ["apple", "orange", "melon"]
irb(main):287:0> dimensions.each do |dimensions|
irb(main):288:1*  length = dimensions[0]
irb(main):289:1>  width = dimensions[1]
irb(main):290:1>  areas << length*width
irb(main):291:1> end

# each_with_indexと併用する
=> [[10, 20], [30, 40], [50, 60]]
dimensions
=> [[10, 20], [30, 40], [50, 60]]
irb(main):312:0> dimensions.each_with_index do |(length, width), i|
irb(main):313:1*  puts "length: #{length}, width: #{width}, i: #{i}"
irb(main):314:1> end
length: 10, width: 20, i: 0
length: 30, width: 40, i: 1
length: 50, width: 60, i: 2
=> [[10, 20], [30, 40], [50, 60]]

# ブロックローカル変数
irb(main):316:0> sum = 0
=> 0
irb(main):317:0> numbers.each do |n; sum|
irb(main):318:1*  sum = 10
irb(main):319:1>  sum += n
irb(main):320:1>  puts sum
irb(main):321:1> end
11
12
13
14
=> [1, 2, 3, 4]
# ブロック外のsumは変わらない
irb(main):322:0> sum
=> 0

# 繰り返し処理以外でつかうブロック

# do .. end と {} の違い
irb(main):324:0> a.delete(100)
=> nil
irb(main):325:0> a.delete(100) do
  irb(main):326:1*  "NG"
  irb(main):327:1> end
=> "NG"
irb(main):331:0> a.delete 100 do
irb(main):332:1*  'NG'
irb(main):333:1> end
=> "NG"
irb(main):334:0> a.delete 100 {'NG'} は使えない
irb(main):335:0> a.delete(100) {'NG'}
=> "NG"

# ブロックの後ろに続けてメソッドを書く
irb(main):336:0> names = ['田中','鈴木']
=> ["田中", "鈴木"]
irb(main):337:0> san_names = names.map { |name| "#{name}さん"}.join('と')
=> "田中さんと鈴木さん"
irb(main):338:0> names = ['田中','鈴木']
=> ["田中", "鈴木"]
irb(main):339:0> names.map do |name|
irb(main):340:1*  "#{name}さん"
irb(main):341:1> end.join('と')
=> "田中さんと鈴木さん"

# 4.9 様々な繰り返し処理
# ---------------------------------------------
# times メソッド
irb(main):342:0> sum = 0
=> 0
irb(main):343:0> 5.times { |n| sum += n }
=> 5
irb(main):344:0> sum = 0
=> 0
irb(main):345:0> 5.times { sum += 1 }
=> 5
irb(main):346:0> a = []
=> []

# upto downto メソッド
irb(main):347:0> 10.upto(14) { |n| a<<n }
=> [10, 11, 12, 13, 14]
irb(main):351:0> 14.downto(10) { |n| a<< n }
=> [14, 13, 12, 11, 10]

# step メソッド
# 開始値.step(上限値, 一度に増減する数)
a = []
=> []
irb(main):355:0> 1.step(10, 2){ |n| a << n }
=> [1, 3, 5, 7, 9]
irb(main):357:0> 10.step(1, -2) { |n| a << n }
=> 10
irb(main):358:0> a
=> [10, 8, 6, 4, 2]

# while until 文
irb(main):360:0> while a.size < 5
irb(main):361:1>  a << 1
irb(main):362:1> end
=> nil
irb(main):363:0> a
=> [1, 1, 1, 1, 1]
irb(main):364:0> a = []
=> []
irb(main):365:0> a << 1 while  a.size < 5
=> nil
irb(main):366:0> a
=> [1, 1, 1, 1, 1]
irb(main):367:0> a = []
=> []
irb(main):368:0> while false
irb(main):369:1>  a << 1
irb(main):370:1> end
=> nil
irb(main):371:0> a
=> []
irb(main):372:0> begin
irb(main):373:1>  a << 1
irb(main):374:1> end while false
=> nil
irb(main):375:0> a
=> [1]
irb(main):376:0> a = [10,20,30,40,50]
=> [10, 20, 30, 40, 50]
irb(main):377:0> until a.size <= 3
irb(main):378:1>  a.delete_at(-1)
irb(main):379:1> end
=> nil
irb(main):380:0> a
=> [10, 20, 30]
# for 文
irb(main):386:0> numbers = [1,2,3,4]
=> [1, 2, 3, 4]
irb(main):387:0> sum = 0
=> 0
irb(main):388:0> for n in numbers
irb(main):389:1>  sum += n
irb(main):390:1> end
=> [1, 2, 3, 4]
irb(main):391:0> sum
=> 10
irb(main):392:0> numbers = [1,2,3,4]
=> [1, 2, 3, 4]
irb(main):393:0> sum = 0
=> 0
irb(main):394:0> numbers.each do |n|
irb(main):395:1*  sum += n
irb(main):396:1> end
=> [1, 2, 3, 4]
irb(main):397:0> sum
=> 10

# loop メソッド
irb(main):007:0> numbers = [1,2,3,4,5]
=> [1, 2, 3, 4, 5]
irb(main):008:0> loop do
irb(main):009:1*  n = numbers.sample
irb(main):010:1>  puts n
irb(main):011:1>  break if n == 5
irb(main):012:1> end
1
2
1
1
1
2
2
1
2
4
5
=> nil
irb(main):013:0> while true
irb(main):014:1>  n = numbers.sample
irb(main):015:1>  puts n
irb(main):016:1>  break if n == 5
irb(main):017:1> end
5
=> nil

# 4.10 繰り返し処理の制御構造
# ----------------------------------------
# break
irb(main):018:0> numbers = [1,2,3,4,5].shuffle
=> [3, 4, 5, 2, 1]
irb(main):019:0> numbers.each do |n|
irb(main):020:1*  puts n
irb(main):021:1>  break if n == 5
irb(main):022:1> end
3
4
5
=> nil
irb(main):023:0> numbers = [1,2,3,4,5].shuffle
=> [1, 5, 4, 2, 3]
irb(main):024:0> i = 0
=> 0
irb(main):025:0> while i < numbers.size
irb(main):026:1>  n = numbers[i]
irb(main):027:1>  puts n
irb(main):028:1>  break if n == 5
irb(main):029:1>  i += 1
irb(main):030:1> end
1
5
=> nil
irb(main):038:0> ret =
irb(main):039:0*  while true
irb(main):040:1>   break
irb(main):041:1>  end
=> nil
irb(main):042:0> ret
=> nil
irb(main):043:0> ret =
irb(main):044:0*  while true
irb(main):045:1>   break 123
irb(main):046:1>  end
=> 123
irb(main):047:0> ret
=> 123

# throw catch 大脱出
irb(main):050:0> catch :done do
irb(main):051:1*  fruits.shuffle.each do |fruit|
irb(main):052:2*   numbers.shuffle.each do |n|
irb(main):053:3*    puts "#{fruit}, #{n}"
irb(main):054:3>    if fruit == 'orange' && n == 3
irb(main):055:4>     throw :done
irb(main):056:4>    end
irb(main):057:3>   end
irb(main):058:2>  end
irb(main):059:1> end
melon, 3
melon, 1
melon, 2
apple, 1
apple, 2
apple, 3
orange, 1
orange, 3
=> nil
irb(main):060:0> ret =
irb(main):061:0*  catch :done do
irb(main):062:1*   throw :done
irb(main):063:1>  end
=> nil
irb(main):064:0> ret
=> nil
irb(main):065:0> ret =
irb(main):066:0*  catch :done do
irb(main):067:1*   throw :done, 123
irb(main):068:1>  ene
irb(main):069:1> end
=> 123
irb(main):070:0> ret
=> 123

# break return 違い
# break:繰り返し処理からの脱出
# return: メソッドからの脱出

# next
# 繰り返し処理を途中で中断して、次の繰り返し処理へ
irb(main):092:0> numbers = [1,2,3,4,5]
=> [1, 2, 3, 4, 5]
irb(main):093:0> i = 0
=> 0
irb(main):094:0> while i < numbers.size
irb(main):095:1>  n = numbers[i]
irb(main):096:1>  i += 1
irb(main):097:1>  next if n.even?
irb(main):098:1>  puts n
irb(main):099:1> end
1
3
5
=> nil

# redo
# 繰り返し処理をやり直したい。最初でなくその回の繰り返しの最初に戻る
irb(main):100:0> foods = ['ピーマン', 'トマト', 'せろり']
=> ["ピーマン", "トマト", "せろり"]
irb(main):101:0> foods.each do |food|
irb(main):102:1*  print "#{food}は好きですか？=>"
irb(main):103:1>  answer = ['はい','いいえ'].sample
irb(main):104:1>  puts answer
irb(main):105:1>  redo unless answer == 'はい'
irb(main):106:1> end
ピーマンは好きですか？=>はい
トマトは好きですか？=>はい
せろりは好きですか？=>はい

# 回数を制限する
irb(main):107:0> foods = ['ピーマン', 'トマト', 'せろり']
=> ["ピーマン", "トマト", "せろり"]
irb(main):108:0> count = 0
=> 0
irb(main):109:0> foods.each do |food|
irb(main):110:1*  print "#{food}は好きですか？=>"
irb(main):111:1>  answer = 'いいえ'
irb(main):112:1>  puts answer
irb(main):113:1>  count += 1
irb(main):114:1>  redo if answer != 'はい' && count < 2
irb(main):115:1>  count = 0
irb(main):116:1> end
ピーマンは好きですか？=>いいえ
ピーマンは好きですか？=>いいえ
トマトは好きですか？=>いいえ
トマトは好きですか？=>いいえ
せろりは好きですか？=>いいえ
せろりは好きですか？=>いいえ
=> ["ピーマン", "トマト", "せろり"]
