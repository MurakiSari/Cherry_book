# 9章　例外処理
#
# ・例外の捕捉
irb(main):258:0> puts 'start'
start
=> nil
irb(main):259:0> module Greeter
irb(main):260:1>  def hello
irb(main):261:2>   'hello'
irb(main):262:2>  end
irb(main):263:1> end
=> :hello
irb(main):264:0> begin
irb(main):265:1>  greeter = Greeter.new  # 例外が起こりうる処理
irb(main):266:1> rescue
irb(main):267:1>  puts 'Continue!!!' # 例外が発生したときの処理
irb(main):268:1> end
Continue!!!
=> nil
irb(main):269:0> puts 'End' # ここまで実行される
End
=> nil

# 例外が発生した箇所がbegin～rescueで囲まれていない場合、例外が発生すると、そこで処理を中断してメソッドの呼び出しを1つずつ戻っていく。
# メソッド呼び出しを戻る途中にその例外を捕捉するコードがあれば、そこから処理を続行できる。
irb(main):279:0>  def method1
irb(main):280:1>   puts '1 start'
irb(main):281:1>   beigin
irb(main):282:1>     method2
irb(main):283:1>    rescue
irb(main):284:1>     puts 'REIGAI'
irb(main):285:1>
irb(main):286:1>   puts 'method1 end'
irb(main):287:1> end
=> :method1
irb(main):288:0> def method2
irb(main):289:1>  puts '2 start'
irb(main):290:1>
irb(main):291:1>  method3
irb(main):292:1>
irb(main):293:1>  puts '2 end'
irb(main):294:1> end
=> :method2
irb(main):295:0> def method3
irb(main):296:1>  puts '3 start'
irb(main):297:1>
irb(main):298:1>  1/0
irb(main):299:1>  puts '3 end'
irb(main):300:1> end
=> :method3
irb(main):301:0> method1
1 start
2 start
3 start
REIGAI
method1 end
=> nil

# クラスを指定して、捕捉する例外を限定する
irb(main):304:0> begin
irb(main):305:1>  1/0
irb(main):306:1> rescue ZeroDivisionError
irb(main):307:1>  puts 'zero error'
irb(main):308:1> end
zero error
=> nil
irb(main):309:0> begin
irb(main):310:1>  'abc'.foo
irb(main):311:1> rescue ZeroDivisionError
irb(main):312:1>  puts 'zero error'
irb(main):313:1> end
Traceback (most recent call last):
4: from /usr/bin/irb:23:in `<main>'
3: from /usr/bin/irb:23:in `load'
2: from /Library/Ruby/Gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
1: from (irb):310
NoMethodError (undefined method 'foo' for "abc":String)
Did you mean?  for

irb(main):314:0> begin
irb(main):315:1>  'abc'.foo
irb(main):316:1> rescue ZeroDivisionError
irb(main):317:1>  puts 'zero error'
irb(main):318:1> rescue NoMethodError
irb(main):319:1>  puts 'No! Method!!!'
irb(main):320:1> end
No! Method!!!
=> nil
irb(main):321:0> begin
irb(main):322:1>  'abc'.foo
irb(main):323:1> rescue ZeroDivisionError, NoMethodError
irb(main):324:1>  puts 'zero error!! or No! Method!'
irb(main):325:1> end
zero error!! or No! Method!
=> nil

irb(main):326:0> begin
irb(main):327:1>  'abc'.foo
irb(main):328:1> rescue ZeroDivisionError, NoMethodError => e
irb(main):329:1>  puts 'zero error!! or No! Method!'
irb(main):330:1>  puts "error: #{e.class} #{e.message}"
irb(main):331:1> end
zero error!! or No! Method!
error: NoMethodError undefined method 'foo' for "abc":String
Did you mean?  for
=> nil

# 注意！
# NoMethodErrorやZeroDivisionErrorもStandardErrorクラスのサブクラスになっている。
# 逆に言うと、StandardErrorクラスを継承していないNoMemoryErrorクラスやSystemExitクラスは、通常のプログラムでは発生しない特殊なエラーが起きたことを表す。
# rescue節に何もクラスを指定しなかった場合に捕捉されるのはStandardErrorとそのサブクラス。
# NoMemoryErrorやSystemExitなど、StandardErrorを継承していない例外クラスは捕捉されない。
#

# ・意図的に例外を発生させる方法
#
irb(main):356:0> def currency_of(country)
irb(main):357:1>  case country
irb(main):358:2>  when :japan
irb(main):359:2>   'yen'
irb(main):360:2>  when :us
irb(main):361:2>   'dollar'
irb(main):362:2>  when :india
irb(main):363:2>   'rupee'
irb(main):364:2>  else
irb(main):365:2>   raise 'Error!!! #{country}'
irb(main):366:2>  end
irb(main):367:1> end
=> :currency_of
irb(main):368:0> currency_of(:japan)
=> "yen"
irb(main):369:0> currency_of(:italy)
Traceback (most recent call last):
5: from /usr/bin/irb:23:in `<main>'
4: from /usr/bin/irb:23:in `load'
3: from /Library/Ruby/Gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
2: from (irb):369
1: from (irb):365:in 'currency_of'
RuntimeError (Error!!! #{country})

irb(main):370:0> def currency_of(country)
irb(main):371:1>  case country
irb(main):372:2>  when :japan
irb(main):373:2>   'yen'
irb(main):374:2>  when :us
irb(main):375:2>   'dollar'
irb(main):376:2>  when :india
irb(main):377:2>   'rupee'
irb(main):378:2>  else
irb(main):379:2>   raise
irb(main):380:2>  end
irb(main):381:1> end
=> :currency_of
irb(main):382:0> currency_of(:italy)
Traceback (most recent call last):
5: from /usr/bin/irb:23:in `<main>'
4: from /usr/bin/irb:23:in `load'
3: from /Library/Ruby/Gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
2: from (irb):382
1: from (irb):379:in 'currency_of'
RuntimeError ()

# 第1引数に例外を、第2引数にエラーメッセージを渡すとRuntimeErrorクラス以外の例外クラスで例外を発生させることができる
#
irb(main):383:0> def currency_of(country)
irb(main):384:1>  case country
irb(main):385:2>  when :japan
irb(main):386:2>   'yen'
irb(main):387:2>  when :us
irb(main):388:2>   'dollar'
irb(main):389:2>  when :india
irb(main):390:2>   'rupee'
irb(main):391:2>  else
irb(main):392:2>   raise ArgumentError, 'Error!!! #{country}'
irb(main):393:2> currency_of(:italy)
irb(main):394:2> end
irb(main):395:1> end
=> :currency_of
irb(main):396:0> currency_of(:italy)
Traceback (most recent call last):
5: from /usr/bin/irb:23:in `<main>'
4: from /usr/bin/irb:23:in `load'
3: from /Library/Ruby/Gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
2: from (irb):396
1: from (irb):392:in 'currency_of'
ArgumentError (Error!!! #{country})


# ・例外処理のベストプラクティス
#
#　１、安易にrescueを使わない
# 例外の発生は文字どおり例外的な状況であり、プログラムが正常に実行できないことを示している。
# にもかかわらず、安易にrescueして続行してしまうと処理中のデータの構造が崩れたりして、余計にややこしい別の問題を引き起こす恐れがある。
# 異常事態が発生したのであればプログラムの実行を即座に中止し（つまりrescueしない）、例外の原因を調査すべき。
# そして、適切な対応（不具合の修正や機能追加など）を行ってから、そのプログラムを再度実行しましょう。
#

# ２、rescueしたら情報を残す
irb(main):397:0> users.each do |user|
irb(main):398:1*  begin
irb(main):399:2>   send_mail_to(user)
irb(main):400:2>  rescue => e
irb(main):401:2>   puts "#{e.class} #{e.message}"
irb(main):402:2>   puts e.backtrace
irb(main):403:2>  end
irb(main):404:1> end
#
# ３、例外処理の対象範囲と対象クラスを極力絞り込む
# 　例外処理を書く場合は、例外が発生しそうな箇所と発生しそうな例外クラスをあらかじめ予想し、その予想を例外処理のコードに反映させるべき。
# 　例外処理の範囲が広すぎたり、捕捉する例外クラスの種類が多すぎたりすると、本来は異常終了扱いにすべき例外まで続行可能な例外として扱われる恐れがある。
#
#
# ４、予期しない条件は異常終了させる
# 　case文で条件分岐を作る場合は、どんなパターンがやってくるか事前にわかっていることが多い。
# 　そういう場合はwhen節で想定可能なパターンをすべて網羅し、else節では「想定外のパターン」として例外を発生させることを検討する。
irb(main):383:0> def currency_of(country)
irb(main):384:1>  case country
irb(main):385:2>  when :japan
irb(main):386:2>   'yen'
irb(main):387:2>  when :us
irb(main):388:2>   'dollar'
irb(main):389:2>  when :india
irb(main):390:2>   'rupee'
irb(main):391:2>  else
irb(main):392:2>   raise ArgumentError, 'Error!!! #{country}'
irb(main):393:2> currency_of(:italy)
irb(main):394:2> end
irb(main):395:1> end
=> :currency_of
irb(main):396:0> currency_of(:italy)
Traceback (most recent call last):
5: from /usr/bin/irb:23:in `<main>'
4: from /usr/bin/irb:23:in `load'
3: from /Library/Ruby/Gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
2: from (irb):396
1: from (irb):392:in 'currency_of'
ArgumentError (Error!!! #{country})
#
#
#
# ５、例外処理よりも条件分岐を使う
# 　begin～rescueを使うよりも条件分岐を使ったほうが可読性やパフォーマンスの面で有利。
# 　例外処理を書く前にAPIドキュメントを読んで、問題の有無を事前に確認できるメソッドが用意されていないかチェックしましょう。
