# 2.8.4
# フォーマットを指定して文字列を作る
irb(main):335:0> sprintf('%0.3f', 1.2)
=> "1.200"
irb(main):336:0> '%0.3f' %  1.2
=> "1.200"
irb(main):337:0> sprintf('%0.3f+%0.3f', 1.2, 0.48)
=> "1.200+0.480"
irb(main):338:0> '%0.3f+%0.3f'%  [1.2, 0.48]
=> "1.200+0.480"

# 2.8.5 その他文字作成
irb(main):339:0> 123.to_s
=> "123"
irb(main):340:0> [10,20,30].join
=> "102030"
irb(main):341:0> 'Hi!'*10
=> "Hi!Hi!Hi!Hi!Hi!Hi!Hi!Hi!Hi!Hi!"
irb(main):342:0> String.new('hello')
=> "hello"
irb(main):343:0> "\u3042\u3044\u3046"
=> "あいう"
irb(main):344:0> 'a'
=> "a"
irb(main):345:0> 'abc'
=> "abc"
irb(main):348:0> ?q
=> "q"

# 2.9　数値の詳細
# -------------------------
# 2.9.4 数値のあれこれ
# Numeric　数値
#  - Integer 整数
#  - Float 小数点
#  - Rational 有理数
#  - Complex 複素数
irb(main):349:0> 0b11111111
=> 255
irb(main):350:0> 0377
=> 255
irb(main):351:0> 0xff
=> 255
irb(main):352:0> (~0b1010).to_s(2)
=> "-1011"
irb(main):354:0> (0b1010 & 0b1100).to_s(2)
=> "1000"
irb(main):355:0> (0b1010 | 0b1100).to_s(2)
=> "1110"
# 2かけ10の-3乗
irb(main):356:0> 2e-3
=> 0.002
irb(main):357:0> 10.class
=> Integer
irb(main):358:0> 1.5.class
=> Float
irb(main):359:0> r = 2 / 3r
=> (2/3)
irb(main):360:0> r
=> (2/3)
irb(main):361:0> r.class
=> Rational
irb(main):362:0> r = '2/3'.to_r
=> (2/3)
irb(main):363:0> r.class
=> Rational
irb(main):364:0> c = 0.3 - 0.5i
=> (0.3-0.5i)
irb(main):365:0> c
=> (0.3-0.5i)
irb(main):366:0> c.class
=> Complex
irb(main):367:0> c = '0.3-0.5i'.to_c
=> (0.3-0.5i)
irb(main):368:0> c.class
=> Complex

# 2.10 真偽値と条件分岐の詳細
# ---------------------------------------
# 評価値がわかった時点で結果を返す
irb(main):369:0> 1 && 2 && 3
=> 3
irb(main):370:0> 1 && nil && 3
=> nil
irb(main):371:0> 1 && false && 3
=> false
irb(main):373:0> nil || false
=> false
irb(main):374:0> false || nil
=> nil
irb(main):375:0> nil || false || 2 || 3
=> 2

# and or not は優先順位が低い
irb(main):377:0> t1 = true
=> true
irb(main):378:0> f1 = false
=> false
irb(main):379:0> t1 and f1
=> false
irb(main):380:0> t1 or  f1
=> true
irb(main):381:0> not t1
=> false
irb(main):382:0> t1 = true
=> true
irb(main):383:0> f1 = false
=> false
irb(main):384:0> !f1 || t1
=> true
irb(main):385:0> not f1 || t1
=> false
irb(main):386:0> !(f1) || t1
=> true
irb(main):387:0> not(f1 || t1)
=> false
irb(main):388:0> t1 = true
=> true
irb(main):389:0> t2 = true
=> true
irb(main):390:0> f1 = false
=> false
irb(main):391:0> t1 || t2 && f1
=> true
irb(main):392:0> t1 or t2 and f1
=> false
irb(main):393:0> t1 || (t2 && f1)
=> true
irb(main):394:0> (t1 or t2) and f1
=> false
irb(main):395:0> def greeting(country)
irb(main):396:1>  country or return 'countryを入力して下さい'
irb(main):397:1>  if country == 'japan'
irb(main):398:2>   'こんにちは'
irb(main):399:2>  else
irb(main):400:2>   'hello'
irb(main):401:2>  end
irb(main):402:1> end
=> :greeting
irb(main):403:0> greeting(nil)
=> "countryを入力して下さい"
irb(main):404:0> greeting('japan')
=> "こんにちは"

# unless 文
irb(main):405:0> status = 'error'
=> "error"
irb(main):406:0> if status != 'OK'
irb(main):407:1>  '何か異常があります'
irb(main):408:1> end
=> "何か異常があります"
irb(main):409:0> status = 'error'
=> "error"
irb(main):410:0> unless status == 'OK'
irb(main):411:1>  '何か異常があります'
irb(main):412:1> end
=> "何か異常があります"
irb(main):413:0> status = 'OK'
=> "OK"
irb(main):414:0> unless status == 'OK'
irb(main):415:1>  '何か異常があります'
irb(main):416:1> else
irb(main):417:1>  '正常です'
irb(main):418:1> end
=> "正常です"
irb(main):419:0> status = 'error'
=> "error"
irb(main):420:0> message =
irb(main):421:0*  unless status == 'ok'
irb(main):422:1>   '何か異常があります'
irb(main):423:1>  else
irb(main):424:1>   '正常です'
irb(main):425:1>  end
=> "何か異常があります"
irb(main):426:0> message
=> "何か異常があります"
irb(main):427:0> '何か異常があります' unless status == 'ok'
=> "何か異常があります"
irb(main):428:0> status = 'error'
=> "error"
irb(main):429:0> unless status == 'ok' then
irb(main):430:1*  '何か異常があります'
irb(main):431:1> end
=> "何か異常があります"

# case文
irb(main):432:0> country = 'italy'
=> "italy"
irb(main):433:0> if country == 'japan'
irb(main):434:1>  'こんにちは'
irb(main):435:1> elsif country == 'us'
irb(main):436:1>  'Hello'
irb(main):437:1> elsif country == 'italy'
irb(main):438:1>  'ciao'
irb(main):439:1> else
irb(main):440:1>  '???'
irb(main):441:1> end
=> "ciao"
irb(main):442:0> case country
irb(main):443:1> when 'japan'
irb(main):444:1>  'こんにちは'
irb(main):445:1> when 'us'
irb(main):446:1>  'Hello'
irb(main):447:1> when 'italy'
irb(main):448:1>  'ciao'
irb(main):449:1> else
irb(main):450:1>  '???'
irb(main):451:1> end
=> "ciao"
irb(main):452:0> country = 'アメリカ'
=> "アメリカ"
irb(main):453:0> case country
irb(main):454:1> when 'japan', '日本'
irb(main):455:1>  'こんにちは'
irb(main):456:1> when 'us', 'アメリカ'
irb(main):457:1>  'Hello'
irb(main):458:1> when 'italy','イタリア'
irb(main):459:1>  'ciao'
irb(main):460:1> else
irb(main):461:1>  '???'
irb(main):462:1> end
=> "Hello"
irb(main):463:0> country = 'italy'
=> "italy"
irb(main):464:0> message =
irb(main):465:0*  case country
irb(main):466:1>  when 'japan'
irb(main):467:1>   'こんにちは'
irb(main):468:1>  when 'us'
irb(main):469:1>   'Hello'
irb(main):470:1>  when 'italy'
irb(main):471:1>   'ciao'
irb(main):472:1>  else
irb(main):473:1>   '???'
irb(main):474:1>  end
=> "ciao"

# 三項演算子
irb(main):475:0> n = 11
=> 11
irb(main):476:0> n > 10 ? '10より大きい' : '10以下'
=> "10より大きい"
irb(main):477:0> n = 11
=> 11
irb(main):478:0> message = n > 10 ? '10より大きい' : '10以下'
=> "10より大きい"
irb(main):479:0> message
=> "10より大きい"

# 2.11 メソッド定義
# -----------------------------------------
irb(main):480:0> def greeting(country = 'japan')
irb(main):481:1>  if country == 'japan'
irb(main):482:2>   'こんにちは'
irb(main):483:2>  else
irb(main):484:2>   'hello'
irb(main):485:2>  end
irb(main):486:1> end
=> :greeting
irb(main):487:0> greeting
=> "こんにちは"
irb(main):488:0> greeting('us')
=> "hello"
irb(main):489:0> def default_args(a, b, c = 0, d = 0)
irb(main):490:1>  "a=#{a}, b=#{b}, c=#{c}, d=#{d}"
irb(main):491:1> end
=> :default_args
irb(main):493:0> default_args(1,2)
=> "a=1, b=2, c=0, d=0"
irb(main):494:0> default_args(1,2,3)
=> "a=1, b=2, c=3, d=0"
irb(main):495:0> default_args(1,2,3,4)
=> "a=1, b=2, c=3, d=4"
irb(main):503:0> def foo(time = Time.now, message = bar)
irb(main):503:0> def foo(time = Time.now, message = bar)
irb(main):504:1>  puts "time:#{time}, message: #{message}"
irb(main):505:1> end
=> :foo
irb(main):506:0> def bar
irb(main):507:1>  "BAR"
irb(main):508:1> end
=> :bar
irb(main):509:0> foo
time:2020-04-30 16:33:43 +0900, message: BAR
=> nil

# ? ! で終わるメソッド
irb(main):510:0> "".empty?
=> true
irb(main):511:0> 'abc'.empty?
=> false
irb(main):512:0> 'watch'.include?('at')
=> true
irb(main):513:0> 'watch'.include?('in')
=> false
# 奇数かどうか
irb(main):514:0> 1.odd?
=> true
irb(main):515:0> 2.odd?
=> false
# 偶数かどうか
irb(main):516:0> 1.even?
=> false
irb(main):517:0> 2.even?
=> true
irb(main):518:0> nil.nil?
=> true
irb(main):519:0> 'abc'.nil?
=> false
irb(main):520:0> 1.nil?
=> false

# upcase! だと呼び出しもとのaまで破壊的に変更してしまう
irb(main):527:0> a = 'ruby'
=> "ruby"
irb(main):528:0> a.upcase
=> "RUBY"
irb(main):529:0> a.upcase!
=> "RUBY"
irb(main):530:0> a
=> "RUBY"

# 2.12 その他基礎知識
# -------------------------------------------------
irb(main):533:0> 'hello'.length
=> 5
irb(main):534:0> 'hello'.size
=> 5
irb(main):535:0> a =
irb(main):536:0* if true
irb(main):537:1> '真です'
irb(main):538:1> else
irb(main):539:1> '偽です'
irb(main):540:1> end
=> "真です"
irb(main):541:0> a
=> "真です"
irb(main):542:0> b = def foo; end
=> :foo
irb(main):543:0> b
=> :foo
# 疑似変数
# nil, true, false, _FILE_, _LINE_, _ENCORDING_
irb(main):545:0> a = 'hello'
=> "hello"
irb(main):546:0> b = 'hello'
=> "hello"
# 変数をほかの変数に代入したり、メソッドの引数として渡したりすると、新しい変数やメソッドの引数は元の変数と同じオブジェクトを参照する。
irb(main):547:0> a.object_id
=> 70355398218020
irb(main):548:0> b.object_id
=> 70355394089740
irb(main):549:0> c = d
=> nil
irb(main):550:0> c = b
=> "hello"
irb(main):551:0> c.object_id
=> 70355394089740
irb(main):552:0> def m(d)
irb(main):553:1> d.object_id
irb(main):554:1> end
=> :m
irb(main):555:0> m(c)
=> 70355394089740
irb(main):556:0> a.equal?(b)
=> false
irb(main):557:0> b.equal?(c)
=> true
irb(main):558:0> a = 'hello'
=> "hello"
irb(main):559:0> b = 'hello'
=> "hello"
irb(main):560:0> c = b
=> "hello"
irb(main):561:0> def m!(d)
  irb(main):562:1>  d.upcase!
  irb(main):563:1> end
=> :m!
irb(main):564:0> m!(c)
=> "HELLO"
irb(main):565:0> c
=> "HELLO"
irb(main):566:0> b
=> "HELLO"
irb(main):567:0> a
=> "hello"

# require
irb(main):569:0> require 'date'
=> true
irb(main):570:0> Date.today
=> #<Date: 2020-04-30 ((2458970j,0s,0n),+0s,2299161j)>

# puts print p の違い
# puts : to_sメソッド、改行あり、戻り値nil、一般ユーザー
# print :　to_sメソッド、改行なし、戻り値nil、一般ユーザー
# p :　inspectメソッド、改行なし、引数のオブジェクト、開発者
irb(main):571:0> puts 123
123
=> nil
irb(main):572:0> puts 'abc'
abc
=> nil
irb(main):573:0> print 123
123=> nil
irb(main):574:0> print 'abc'
abc=> nil
irb(main):575:0> p 123
123
=> 123
irb(main):576:0> p 'abc'
"abc"
=> "abc"
irb(main):579:0> s = "abc\ndef"
=> "abc\ndef"
irb(main):580:0> puts s
abc
def
=> nil
irb(main):581:0> print s
abc
def=> nil
irb(main):582:0> p s
"abc\ndef"
=> "abc\ndef"
irb(main):583:0> a = [1,2,3]
=> [1, 2, 3]
irb(main):584:0> puts a
1
2
3
=> nil
irb(main):585:0> print a
[1, 2, 3]=> nil
irb(main):586:0> p a
[1, 2, 3]
=> [1, 2, 3]
