# 第10章 yield と proc を理解する
#
# ブロックを利用するメソッドの定義とyield
#
# ブロックを利用するメソッドの定義とyield
#

irb(main):005:0> def greeting
irb(main):006:1>   puts 'Hello'
irb(main):007:1>   puts 'Hi'
irb(main):008:1> end
=> :greeting
irb(main):009:0> greeting
Hello
Hi
=> nil
# 結果は変わらない
irb(main):016:0> greeting do
irb(main):017:1*   puts "sari"
irb(main):018:1> end
Hello
Hi
=> nil
# メソッド内にyieldを追加することでブロック呼び出し
irb(main):019:0> def greeting
irb(main):020:1>   puts "Hello"
irb(main):021:1>   yield
irb(main):022:1>   puts "Hi"
irb(main):023:1> end
=> :greeting
irb(main):024:0> greeting do
irb(main):025:1*   puts "sari"
irb(main):026:1> end
Hello
sari
Hi
=> nil

irb(main):036:0> def greeting
irb(main):037:1>   put "Hello"
irb(main):038:1>   yield
irb(main):039:1>   yield
irb(main):040:1> end
=> :greeting
irb(main):041:0> def greeting
irb(main):042:1>   puts "Hello"
irb(main):043:1>   yield
irb(main):044:1>   yield
irb(main):045:1> end
=> :greeting
irb(main):046:0> greeting do
irb(main):047:1*   puts "sari"
irb(main):048:1> end
Hello
sari
sari
=> nil

# ブロックをつけないとエラーになる
irb(main):049:0> greeting
Hello
Traceback (most recent call last):
    5: from /usr/bin/irb:23:in `<main>'
        4: from /usr/bin/irb:23:in `load'
        3: from /Library/Ruby/Gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
2: from (irb):49
1: from (irb):43:in 'greeting'
LocalJumpError (no block given (yield))

# yieldはブロックに引数を渡したり、ブロックの戻り値を受け取ったりできる。
# 以下は“Hi”という引数をブロックに渡し、ブロックの戻り値を受け取ってputsメソッドで出力するコード例。

irb(main):061:0> def greeting
irb(main):062:1>   puts "Hello"
irb(main):063:1>   text = yield'Hi'
irb(main):064:1>   puts text
irb(main):065:1>   puts "Good night"
irb(main):066:1> end
=> :greeting
irb(main):067:0> greeting do |text|
irb(main):068:1*   text*2
irb(main):069:1> end
Hello
HiHi
Good night
=> nil

# ブロックをメソッド引数として受け取る
#
# defメソッド(&引数)
# 　#ブロックを実行する
# 　引数.call
# end

irb(main):070:0> def greeting(&block)
irb(main):071:1>   puts "Hello"
# call を使ってブロックを呼び出す
irb(main):072:1>   text = block.call("Hi")
irb(main):073:1>   puts text
irb(main):074:1>   puts "Good night"
irb(main):075:1> end
=> :greeting
irb(main):076:0> greeting do |text|
irb(main):077:1*   text*2
irb(main):078:1> end
Hello
HiHi
Good night
=> nil

# ちなみに、ブロックを引数として受け取る場合でもyieldやblock_given?メソッドは使用可能です。
#
irb(main):079:0> def greeting(&block)
irb(main):080:1>   puts "Hello"
irb(main):081:1>
irb(main):082:1>   unless block.nil?
irb(main):083:2>     text = block.call("Hi")
irb(main):084:2>     puts text
irb(main):085:2>   end
irb(main):086:1>   puts "Good night"
irb(main):087:1> end
=> :greeting
irb(main):088:0> greeting
Hello
Good night
=> nil
irb(main):089:0> greeting do |text|
irb(main):090:1*   text*2
irb(main):091:1> end
Hello
HiHi
Good night
=> nil

irb(main):092:0> def greeting(&block)
irb(main):093:1>   puts "Hello"
irb(main):094:1>
irb(main):095:1>  if block_given?
irb(main):096:2>   text = yield"Hi"
irb(main):097:2>   puts text
irb(main):098:2>  end
irb(main):099:1>  puts "Good night"
irb(main):100:1> end
=> :greeting

# Proc オブジェクト
#
# Procクラスはブロックをオブジェクト化するためのクラス。
# たとえば、Stringクラスであれば文字列を、Integerクラスであれば整数を表すが、Procクラスはブロック、つまり「何らかの処理（何らかの手続き）」を表す。
#
irb(main):101:0> hello_proc = Proc.new do
irb(main):102:1*  "Hello!"
irb(main):103:1> end
=> #<Proc:0x00007fcd050f3438@(irb):101>
irb(main):104:0> hello_proc = Proc.new {"Hello"}
=> #<Proc:0x00007fcd0483aff8@(irb):104>
irb(main):105:0> hello_proc.call
=> "Hello"
irb(main):106:0> add_proc = Proc.new { |a,b| a+b }
=> #<Proc:0x00007fcd05a56e08@(irb):106>
irb(main):107:0> add_proc.call(10,20)
=> 30
irb(main):108:0> add_proc = Proc.new { |a = 0, b = 0| a+b }
=> #<Proc:0x00007fcd05910d78@(irb):108>
irb(main):109:0> add_proc.call
=> 0
irb(main):110:0> add_proc.call(10)
=> 10
irb(main):111:0> add_proc.call(10, 20)
=> 30

# 引数のblockはProcクラスのインスタンスで
#
irb(main):124:0> def greeting(&block)
irb(main):125:1>    puts block.class
irb(main):126:1>
irb(main):127:1>    puts "Hello"
irb(main):128:1>    text = block.call("hi")
irb(main):129:1>    puts text
irb(main):130:1>    puts "Good night"
irb(main):131:1> end
=> :greeting
irb(main):132:0> greeting do |text|
irb(main):133:1*  text*2
irb(main):134:1> end
Proc
Hello
hihi
Good night
=> nil

irb(main):141:0>  def greeting(&block)
irb(main):142:1>    puts "Hello"
irb(main):143:1>    text = block.call("Hi")
irb(main):144:1>    puts text
irb(main):145:1>   puts "Good night"
irb(main):146:1> end
=> :greeting
irb(main):147:0> repeat_proc = Proc.new { |text| text*2 }
=> #<Proc:0x00007fcce6014d38@(irb):147>

# Procオブジェクトをブロックの代わりに渡す際は&repeat_procのように、手前に&が付いている点に注意。
# &がないとブロックではなく、普通の引数が渡されたとみなされます。
#

irb(main):148:0> greeting(&repeat_proc)
Hello
HiHi
Good night
=> nil

irb(main):149:0> greeting(repeat_proc)
Traceback (most recent call last):
5: from /usr/bin/irb:23:in `<main>'
4: from /usr/bin/irb:23:in `load'
3: from /Library/Ruby/Gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
2: from (irb):149
1: from (irb):141:in 'greeting'
ArgumentError (wrong number of arguments (given 1, expected 0))

# Procオブジェクトを普通の引数として渡す
#
irb(main):150:0> def greeting(arrange_proc)
irb(main):151:1>   puts "Hello"
irb(main):152:1>   text = arrange_proc.call("Hi")
irb(main):153:1>   puts text
irb(main):154:1>   puts "good night"
irb(main):155:1> end
=> :greeting
irb(main):156:0> repeat_proc = Proc.new { |text| text*2 }
=> #<Proc:0x00007fcd05a4de98@(irb):156>
irb(main):157:0> greeting(repeat_proc)
Hello
HiHi
good night
=> nil