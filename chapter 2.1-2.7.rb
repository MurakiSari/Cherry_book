### 2章　Rubyの基礎を理解する
# --------------------------------------
# 2.1 イントロダクション
# 2.2 Rubyの基礎知識
irb(main):002:0> 1.to_s
=> "1"
irb(main):004:0> nil.to_s
=> ""
irb(main):005:0> true.to_s
=> "true"
irb(main):006:0> false.to_s
=> "false"
irb(main):007:0> /\d+/.to_s
=> "(?-mix:\\d+)"
irb(main):008:0> 1.to_s()
=> "1"
irb(main):009:0> 1.to_s
=> "1"
irb(main):010:0> 10.to_s(16)
=> "a"
irb(main):011:0> 10.to_s 16
=> "a"
# セミコロンで明示的に改行を指定
irb(main):013:0> 1.to_s; nil.to_s; 10.to_s(16)
=> "a"
irb(main):014:0> 10.to_s(
irb(main):015:1* 16
irb(main):016:1> )
=> "a"
irb(main):017:0> 10.to_s
=> "10"
irb(main):018:0> 16
=> 16
irb(main):019:0> 10.to_s \
irb(main):020:0* 16
=> "a"

# 空白は極端に多くても、一応Rubyは動作する
irb(main):049:0> def
irb(main):050:1* add   (a,b)
irb(main):051:1>     a+ b
irb(main):052:1>    end
=> :add
irb(main):053:0> add(    4,5)
=> 9

irb(main):054:0> def add(a,b)
irb(main):055:1>  a+b
irb(main):056:1> end
=> :add
irb(main):057:0> add(4,5)
=> 9

# ローカル変数の代入
# -----------------------------------------------------
irb(main):058:0> s = 'Hello'
=> "Hello"
irb(main):059:0> n = 123*2
=> 246
# 変数を宣言するには何かしらの代入が必要
irb(main):060:0> x
=> NameError (undefined local variable or method 'x' for main:Object)
irb(main):061:0> x = nil
=> nil
# 変数名はスネークケースが主流
irb(main):062:0> special_price = 200
=> 200
# キャメルケースも一応使えるけど一般的でない
irb(main):063:0> specialPrice = 200
=> 200
# アンダースコアからでも一応始めれるけど一般的でない
irb(main):064:0> _special_price = 200
=> 200
# 数値の入れ方
irb(main):065:0> special_price_2 = 200
=> 200
# 数値からは始められない
irb(main):066:0> 2_special_price = 300
SyntaxError ((irb):66: trailing '_' in number)
# アルファベット以外を変数名に使うこともできるけど一般的でない
irb(main):067:0> 特別価格 = 200
=> 200
irb(main):068:0> 特別価格*2
=> 400
# 同時に代入も可能
irb(main):069:0> a,b = 1,2
=> [1, 2]
irb(main):070:0> a
=> 1
irb(main):071:0> b
=> 2
# 右辺が少ない場合はnilが入る
irb(main):072:0> c,d = 10
=> 10
irb(main):073:0> c
=> 10
irb(main):074:0> d
=> nil
# 右辺が多い場合は切り捨てられる
irb(main):075:0> a,f = 100, 200, 300
=> [100, 200, 300]
irb(main):076:0> a
=> 100
irb(main):077:0> f
=> 200
irb(main):078:0> a = b = 100
=> 100
irb(main):079:0> a
=> 100
irb(main):080:0> b
=> 100

# 2.3 文字列
# ---------------------------------------------
# \n で改行
irb(main):082:0> puts"こんにちは\nさようなら"
こんにちは
さようなら
=> nil
# シングルクウォートでは認識されない
irb(main):083:0> puts'こんにちは\nさようなら'
こんにちは\nさようなら
=> nil

irb(main):084:0> name = 'Alice'
=> "Alice"
irb(main):085:0> puts "Hello, #{name}!"
Hello, Alice!
=> nil
irb(main):086:0> i = 10
=> 10
irb(main):087:0> puts "#{i}は16進数にすると#{i.to_s(16)}です"
10は16進数にするとaです
=> nil

# シングルクウォートでは式展開されない
irb(main):088:0> name = 'Alice'
=> "Alice"
irb(main):089:0> puts '#{i}は16進数にすると#{i.to_s(16)}です'
#{i}は16進数にすると#{i.to_s(16)}です
=> nil
# + を使ってつなげることはできる
irb(main):090:0> name = 'Alice'
=> "Alice"
irb(main):091:0> puts 'Hello,' + name + '!'
Hello,Alice!
=> nil
irb(main):092:0> name = 'Alice'
=> "Alice"
# ダブルクォートで式展開して欲しくない時は、前に \ をつけてあげる
irb(main):093:0> puts "Hello, \#{name}!"
Hello, #{name}!
=> nil
# シングルクオート文字列の中にシングルクオートを、ダブルクオート文字列の中でダブルクオートを含めたい場合も手前にバックスラッシュを付ける
irb(main):094:0> puts 'He said, "Don\'t speak."'
He said, "Don't speak."
=> nil
irb(main):095:0> puts "He said, \"Don't speak.\""
He said, "Don't speak."
=> nil

# 文字列の比較
# ----------------------------------------------------
irb(main):096:0> 'ruby' == 'ruby'
=> true
irb(main):097:0> 'ruby' == 'Ruby'
=> false
irb(main):098:0> 'ruby' != 'Ruby'
=> true
irb(main):099:0> 'ruby' != 'ruby'
=> false
# 文字コードが大小比較の基準
irb(main):100:0> 'a'<'b'
=> true
irb(main):101:0> 'a'<'A'
=> false
irb(main):102:0> 'a'>'A'
=> true
irb(main):103:0> 'abc'<'ab'
=> false
irb(main):104:0> 'abc'<'abcd'
=> true
irb(main):105:0> 'あいうえお'<'かきくけこ'
=> true

# 2.4 数値
# -----------------------------------
# 数値には_を含めることができる。_は無視される。区切り文字として便利。
irb(main):110:0> 1_000_000_000
=> 1000000000
irb(main):111:0> 10 + 20
=> 30
irb(main):112:0> 100 - 25
=> 75
irb(main):113:0> 12*5
=> 60
irb(main):114:0> 20 / 5
=> 4
irb(main):115:0> n = 1
=> 1
irb(main):116:0> -n
=> -1
# 整数同士の割り算は整数になる。小数点以下は切り捨て
irb(main):117:0> 1 / 2
=> 0
# 小数点が必要なら、どちらかを小数点にする
irb(main):118:0> 1.0 / 2
=> 0.5
irb(main):119:0> 1 / 2.0
=> 0.5
# to_f メソッドで小数点にしてくれる
irb(main):120:0> n = 1
=> 1
irb(main):121:0> n.to_f
=> 1.0
irb(main):122:0> n.to_f/2
=> 0.5
# % は割り算の余りを求める
irb(main):123:0> 8%3
=> 2
# ** はべき乗
irb(main):124:0> 2**3
=> 8
irb(main):125:0> 1<2
=> true
# + - より * / が優先
irb(main):126:0> 2*3+4*5-6/2
=> 23
irb(main):127:0> (2*3)+(4*5)-(6/2)
=> 23
irb(main):128:0> n = 1
=> 1
irb(main):129:0> n += 1
=> 2
irb(main):130:0> n -= 1
=> 1
irb(main):133:0> n = 2
=> 2
irb(main):134:0> n *= 3
=> 6
irb(main):135:0> n /= 2
=> 3
# 2乗してくれる
irb(main):136:0> n **= 2
=> 9
irb(main):137:0> n /= 3
=> 3
# 3乗してくれる
irb(main):138:0> n **= 3
=> 27

# 数値と文字列は暗黙的には変換されない
irb(main):139:0> 1 + '10'
TypeError (String cannot be coerced into Integer)
irb(main):140:0> 1 + "10".to_i
=> 11
irb(main):141:0> 1 + "10".to_f
=> 11.0

irb(main):142:0> number = 3
=> 3
irb(main):143:0> 'Number is' = number
TypeError (no implicit conversion of Integer into String)

irb(main):145:0> 'Number is ' +  number.to_s
=> "Number is 3"

# 小数点の丸め誤差
irb(main):146:0> 0.1 * 3.0
=> 0.30000000000000004
irb(main):147:0> 0.1 * 3.0 == 0.3
=> false
irb(main):148:0> 0.1 * 3.0 <= 0.3
=> false
# Rational(有理数)クラス使う
irb(main):150:0> 0.1r * 3.0r
=> (3/10)
irb(main):151:0> 0.1r * 3.0r == 0.3
=> true
irb(main):152:0> 0.1r * 3.0r <= 0.3
=> true

# 変数にはrationalizeメソッド使う
irb(main):153:0> a = 0.1
=> 0.1
irb(main):154:0> b = 3.0
=> 3.0
irb(main):156:0> a.rationalize*b.rationalize
=> (3/10)
irb(main):158:0> (0.1r*3.0r).to_f
=> 0.3

# 2.5　真偽値と条件分岐
# ------------------------------------------
# ・&& は || よりも優先度高い
irb(main):164:0> t1 =  true
=> true
irb(main):165:0> t2 = true
=> true
irb(main):166:0> f1 = false
=> false
irb(main):167:0> t1 && t2
=> true
irb(main):168:0> t1 && f1
=> false
irb(main):169:0> t1 =  true
=> true
irb(main):170:0> f1 = false
=> false
irb(main):171:0> f2 = false
=> false
irb(main):172:0> t1 || f1
=> true
irb(main):173:0> f1 || f2
=> false
irb(main):174:0> t1 = true
=> true
irb(main):175:0> t2 = true
=> true
irb(main):176:0> f1 = false
=> false
irb(main):177:0> f2 = false
=> false
irb(main):178:0> t1 && t2 || f1 && f2
=> true
irb(main):179:0> (t1 && t2) || (f1 && f2)
=> true
irb(main):180:0> t1 && (t2 || f1) && f2
=> false
irb(main):181:0> t1 = true
=> true
irb(main):182:0> f1 = false
=> false
irb(main):183:0> !t1
=> false
irb(main):184:0> !f1
=> true
irb(main):185:0> t1 && f1
=> false
irb(main):186:0> !(t1 && f1)
=> true

# if文
irb(main):188:0> if n > 10
irb(main):189:1>  puts '10より大きい'
irb(main):190:1> else
irb(main):191:1>  puts '10以下'
irb(main):192:1> end
10より大きい
=> nil
irb(main):193:0> country = 'italy'
=> "italy"
irb(main):194:0> if country == 'japan'
irb(main):195:1>  puts 'こんにちは'
irb(main):196:1> elsif country == 'us'
irb(main):197:1>  puts 'Hello'
irb(main):198:1> elsif country == 'italy'
irb(main):199:1>  puts 'ciao'
irb(main):200:1> else
irb(main):201:1>  puts '???'
irb(main):202:1> end
ciao
=> nil
irb(main):203:0> if country == 'japan'
irb(main):204:1>  'こんにちは'
irb(main):205:1> elsif country == 'us'
irb(main):206:1>  'Hello'
irb(main):207:1> elsif country == 'italy'
irb(main):208:1>  'ciao'
irb(main):209:1> else
irb(main):210:1>  '???'
irb(main):211:1> end
=> "ciao"
irb(main):212:0> point = 7
=> 7
irb(main):213:0> day = 1
=> 1
# 後置if
irb(main):214:0> if day == 1
irb(main):215:1>  point *= 5
irb(main):216:1> end
=> 35
irb(main):217:0> point
=> 35
irb(main):218:0> country = 'italy'
=> "italy"
irb(main):219:0> if country == 'japan' then 'こんにちは'
irb(main):220:1> elsif country =='us' then 'Hello'
irb(main):221:1> elsif country =='italy' then 'ciao'
irb(main):222:1> else '???'
irb(main):223:1> end
=> "ciao"

# 2.6 メソッド定義
# ----------------------------------
# ・引数の()は省略もできるけど一般的でない
irb(main):224:0> def hello_world
irb(main):225:1>  'Hello, world!'
irb(main):226:1> end
=> :hello_world
irb(main):227:0> def add(a, b)
irb(main):228:1>  return a + b
irb(main):229:1> end
=> :add
irb(main):230:0> add(1,2)
=> 3
irb(main):231:0> def greeting(country)
irb(main):232:1>  if country == 'japan'
irb(main):233:2>    'こんにちは'
irb(main):234:2>  else
irb(main):235:2>   'hello'
irb(main):236:2>  end
irb(main):237:1> end
=> :greeting
irb(main):238:0> greeting('japan')
=> "こんにちは"
irb(main):239:0> greeting('us')
=> "hello"
irb(main):240:0> def greeting(country)
irb(main):241:1>  return 'countryを入力してください' if country.nil?
irb(main):242:1>  if country == 'japan'
irb(main):243:2>   'こんにちは'
irb(main):244:2>  else
irb(main):245:2>   'hello'
irb(main):246:2>  end
irb(main):247:1> end
=> :greeting
irb(main):262:0> greeting(nil)
=> "countryを入力してください"
irb(main):263:0> greeting('japan')
=> "こんにちは"
irb(main):264:0> def greeting country
irb(main):265:1>  if country == 'japan'
irb(main):266:2>   'こんにちは'
irb(main):267:2>  else
irb(main):268:2>   'hello'
irb(main):269:2>  end
irb(main):270:1> end
=> :greeting

# 2.7 FizzBuzzプログラム
irb(main):271:0> def fizz_buzz(n)
irb(main):272:1>  if n % 15 == 0
irb(main):273:2>   'Fizz Buzz'
irb(main):274:2>  elsif n % 3 == 0
irb(main):275:2>   'Fizz'
irb(main):276:2>  elsif n % 5 == 0
irb(main):277:2>   'Buzz'
irb(main):278:2>  else
irb(main):279:2>   n.to_s
irb(main):280:2>  end
irb(main):281:1> end
=> :fizz_buzz
irb(main):282:0> puts fizz_buzz(1)
1
=> nil
irb(main):283:0> puts fizz_buzz(2)
2
=> nil
irb(main):284:0> puts fizz_buzz(3)
Fizz
=> nil
irb(main):285:0> puts fizz_buzz(4)
4
=> nil
irb(main):286:0> puts fizz_buzz(5)
Buzz
=> nil
irb(main):287:0> puts fizz_buzz(6)
Fizz
=> nil
irb(main):288:0> puts fizz_buzz(15)
Fizz Buzz
=> nil


# 2.8　文字列詳細
# %記法で文字列を作る
# 区切り文字は! ? () 使える
irb(main):290:0> %q!He said. "Don't speak"!
=> "He said. \"Don't speak\""
irb(main):291:0> %q(He said. "Don't speak")
=> "He said. \"Don't speak\""
irb(main):293:0> something = "Hello"
=> "Hello"
irb(main):294:0> puts %Q(He said. "Don't speak")
He said. "Don't speak"
=> nil
irb(main):295:0> puts %Q(He said. "#{something}")
He said. "Hello"
=> nil
irb(main):296:0> something = "Bye"
=> "Bye"
irb(main):297:0> %(He said. "#{something}")
=> "He said. \"Bye\""
irb(main):298:0> %q?He said. "Don't speak"?
=> "He said. \"Don't speak\""

# 2.8.3 ヒアドキュメント(行指向文字型リテラル)
# 複数行にわたる長い文字列を作成する場合はヒアドキュメントがいいらしい
irb(main):303:0> a = <<TEXT
irb(main):304:0" これは
irb(main):305:0" ドキュメント
irb(main):306:0" です
irb(main):307:0" TEXT <<TEXT
=> "これは\nドキュメント\nです\n"

irb(main):308:0> puts a
これは
ドキュメント
です
=> nil
irb(main):309:0> <<HTML
irb(main):310:0" div
irb(main):311:0"  ima srv="sample/jpeg"
irb(main):312:0" HTML
=> "div\n ima srv=\"sample/jpeg\"\n"

irb(main):313:0> name = 'Alice'
=> "Alice"
irb(main):314:0> a = <<TEXT
irb(main):315:0" ようこそ、#{name}さん
irb(main):316:0" 以下のメッセージご覧
irb(main):317:0" ください
irb(main):318:0" TEXT
=> "ようこそ、Aliceさん\n以下のメッセージご覧\nください\n"
irb(main):319:0> puts a
ようこそ、Aliceさん
以下のメッセージご覧
ください
=> nil

# <<識別子をメソッドの引数として渡すこともできる
irb(main):320:0> a = 'Ruby'
=> "Ruby"
irb(main):321:0> a.prepend(<<TEXT)
irb(main):322:1" Java
irb(main):323:1" PHP
irb(main):324:1" TEXT
=> "Java\nPHP\nRuby"
irb(main):325:0> puts a
Java
PHP
Ruby
=> nil

b = <<TEXT.upcase
irb(main):331:0" Hello,
irb(main):332:0" Good-bye
irb(main):333:0" TEXT
=> "HELLO,\nGOOD-BYE\n"
irb(main):334:0> puts b
HELLO,
GOOD-BYE
=> nil