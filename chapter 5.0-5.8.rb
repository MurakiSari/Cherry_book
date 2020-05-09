# 第5章 ハッシュやシンボルを理解する
# ------------------------------------
# 5.2 ハッシュ
irb(main):004:0> [].class
=> Array
irb(main):005:0> {}.class
=> Hash
irb(main):006:0> {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
=> {"japan"=>"yen", "us"=>"dollar", "india"=>"rupee"}
irb(main):007:0> {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee', }
=> {"japan"=>"yen", "us"=>"dollar", "india"=>"rupee"}

# 同じキーが二つ存在する時は、後者が優先
irb(main):008:0> {'japan' => 'yen', 'japan' => '円' }
(irb):8: warning: key "japan" is duplicated and overwritten on line 8
=> {"japan"=>"円"}

irb(main):014:0> currencies = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
=> {"japan"=>"yen", "us"=>"dollar", "india"=>"rupee"}
irb(main):015:0> currencies['india']
=> "rupee"
irb(main):016:0> currencies['aaa']
=> nil
irb(main):017:0> currencies = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
=> {"japan"=>"yen", "us"=>"dollar", "india"=>"rupee"}
irb(main):018:0> currencies.each do |key, value|
irb(main):019:1*  puts "#{key}:#{value}"
irb(main):020:1> end
japan:yen
us:dollar
india:rupee
=> {"japan"=>"yen", "us"=>"dollar", "india"=>"rupee"}
irb(main):021:0> currencies = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
=> {"japan"=>"yen", "us"=>"dollar", "india"=>"rupee"}
irb(main):022:0> currencies.each do |key_value|
irb(main):023:1*  key = key_value[0]
irb(main):024:1>  value = key
irb(main):025:1>  puts"#{key}:#{value}"
irb(main):026:1> end
japan:japan
us:us
india:india
=> {"japan"=>"yen", "us"=>"dollar", "india"=>"rupee"}
irb(main):027:0> a = {'x' => 1, 'y' => 2, 'z'=> 3}
=> {"x"=>1, "y"=>2, "z"=>3}
irb(main):028:0> b = {'x' => 1, 'y' => 2, 'z' => 3}
=> {"x"=>1, "y"=>2, "z"=>3}
irb(main):029:0> a == b
=> true
irb(main):030:0> c = {'z' => 3, 'y' => 2, 'x' => 1}
=> {"z"=>3, "y"=>2, "x"=>1}
irb(main):031:0> a == c
=> true
irb(main):032:0> d = {'x' => 10, 'y' => 2, 'z' => 3}
=> {"x"=>10, "y"=>2, "z"=>3}
irb(main):033:0> a ==d
=> false
irb(main):034:0> {}.size
=> 0
irb(main):035:0> {'x' => 1, 'y' => 2, 'z'=> 3}.size
=> 3
irb(main):036:0> currencies = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
=> {"japan"=>"yen", "us"=>"dollar", "india"=>"rupee"}
irb(main):037:0> currencies.delete('japan')
=> "yen"
irb(main):038:0> currencies
=> {"us"=>"dollar", "india"=>"rupee"}
irb(main):039:0> currencies = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
=> {"japan"=>"yen", "us"=>"dollar", "india"=>"rupee"}
irb(main):040:0> currencies.delete('a')
=> nil
irb(main):041:0> currencies.delete('a') { |key| "Not found: #{key}" }
=> "Not found: a"

# 5.3 シンボル
irb(main):042:0> :apple.class
=> Symbol
irb(main):043:0>
irb(main):044:0> 'apple'.class
=> String
irb(main):045:0> 'apple' == 'apple'
=> true
irb(main):046:0> :apple == :apple
=> true

# シンボルは全部同じIDになるが、文字列は異なる
irb(main):047:0> :apple.object_id
=> 1517468
irb(main):048:0> :apple.object_id
=> 1517468
irb(main):049:0> :apple.object_id
=> 1517468
irb(main):050:0> 'apple'.object_id
=> 70122744628280
irb(main):051:0> 'apple'.object_id
=> 70122752669860
irb(main):052:0> 'apple'.object_id
=> 70122744774780
irb(main):055:0> string = 'apple'
=> "apple"
irb(main):056:0> string.upcase!
=> "APPLE"
irb(main):057:0> string
=> "APPLE"
irb(main):058:0> symbol = :apple
=> :apple
irb(main):059:0> symbol.upcase!
= > NoMethodError

# 5.4 続・ハッシュについて
currencies = { :japan => 'yen', :us => 'dollar', :india => 'rupee' }
=> {:japan=>"yen", :us=>"dollar", :india=>"rupee"}
irb(main):061:0> currencies[:us]
=> "dollar"
irb(main):062:0> currencies[:italy]
=> nil
irb(main):063:0> currencies[:italy] = 'euro'
=> "euro"
irb(main):064:0> currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
=> {:japan=>"yen", :us=>"dollar", :india=>"rupee"}
irb(main):065:0> currencies[:us]
=> "dollar"
{ japan: :yen, us: :dollar, india: :rupee } == { :japan => :yen, :us => :dollar, :india => :rupee }
=> true

irb(main):001:0> hash = { 'abc' => 123, def: 456 }
=> {"abc"=>123, :def=>456}
irb(main):002:0> hash['abc']
=> 123
irb(main):003:0> hash[:def]
=> 456
irb(main):004:0> hash[:abc]
=> nil
irb(main):005:0> hash['def']
=> nil
irb(main):006:0> person = { name: 'Alice', age: 20, friends: ['Bob', 'Carol'], phones: { home: '1234-000', mobile: '5678-0000' } }
=> {:name=>"Alice", :age=>20, :friends=>["Bob", "Carol"], :phones=>{:home=>"1234-000", :mobile=>"5678-0000"}}
irb(main):007:0> person[:age]
=> 20
irb(main):008:0> person[:friends]
=> ["Bob", "Carol"]
person[:phones][:mobile]
=> "5678-0000"

irb(main):012:0> def buy_burger(menu, drink, potato)
irb(main):013:1>  if drink
irb(main):014:2>  end
irb(main):015:1>  if potato
irb(main):016:2>  end
irb(main):017:1> end
=> :buy_burger
irb(main):018:0> buy_burger('cheese', true, true) # これだと何の引数かわかりづらい
=> nil
irb(main):019:0> buy_burger('fish', true, false) # これだと何の引数かわかりづらい
=> nil

# メソッドのキーワード引数を使うと可読性UP
irb(main):012:0> def buy_burger(menu, drink: true, potato: true)
irb(main):013:1>  if drink
irb(main):014:2>  end
irb(main):015:1>  if potato
irb(main):016:2>  end
irb(main):017:1> end
=> :buy_burger
irb(main):018:0> buy_burger('cheese', drink: true, potato: true)
=> nil
irb(main):019:0> buy_burger('fish', drink: true, potato: false)
=> nil
# ・引数はデフォルト値が設定されているので、省略可能
# ・キーワード引数は、順番入れ替えてもOK

# キーワード引数は、デフォルト値を省略することもできる
irb(main):012:0> def buy_burger(menu, drink:, potato:)
irb(main):013:1>  if drink
irb(main):014:2>  end
irb(main):015:1>  if potato
irb(main):016:2>  end
irb(main):017:1> end
=> :buy_burger
irb(main):018:0> buy_burger('cheese', drink: true, potato: true)
=> nil
# ・引数はデフォルト値が設定されていないので、省略不可

# 5.6 ハッシュについてもっと詳しく
irb(main):001:0> currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
=> {:japan=>"yen", :us=>"dollar", :india=>"rupee"}
irb(main):002:0> currencies.keys
=> [:japan, :us, :india]
irb(main):003:0> currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
=> {:japan=>"yen", :us=>"dollar", :india=>"rupee"}
irb(main):005:0> currencies.values
=> ["yen", "dollar", "rupee"]
irb(main):006:0> currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
=> {:japan=>"yen", :us=>"dollar", :india=>"rupee"}
irb(main):007:0> currencies.has_key?(:japan)
=> true
irb(main):008:0> currencies.has_key?(:italy)
=> false
# ** でハッシュを展開させることができる
irb(main):009:0> h = { us: 'dollar', india: 'rupee' }
=> {:us=>"dollar", :india=>"rupee"}
irb(main):011:0> { japan: 'yen', **h }
=> {:japan=>"yen", :us=>"dollar", :india=>"rupee"}
irb(main):012:0> h = { us: 'dollar', india: 'rupee' }
=> {:us=>"dollar", :india=>"rupee"}
irb(main):013:0> { japan: 'yen' }.merge(h)
=> {:japan=>"yen", :us=>"dollar", :india=>"rupee"}

# ハッシュを使った擬似パスワード引数
irb(main):014:0> def buy_burger(menu, options =[])
irb(main):015:1>  drink = opitions[:drink]
irb(main):016:1>  potato = options[:potato]
irb(main):017:1> end
=> :buy_burger
irb(main):018:0> buy_burger('cheese', drink: true, potato:true)

# **other　で任意のキーワードを受け付ける
irb(main):023:0>  def buy_buger(menu, drink: true, potato: true, **others)
irb(main):024:1>   puts
irb(main):025:1>  end
=> :buy_buger
irb(main):026:0> buy_buger('fish', drink: true, potato: false, salad: true, chicken: false)

# メソッドの最後の引数がハッシュであれば、メソッド呼び出しの時はハッシュ{}を省略しても良い
irb(main):027:0> def buy_burger(menu, options = {})
irb(main):028:1>  puts options
irb(main):029:1> end
=> :buy_burger
irb(main):030:0> buy_burger('fish', {'drink' => true, 'potato' => false})
{"drink"=>true, "potato"=>false}
=> nil
irb(main):031:0> buy_burger('fish', 'drink' => true, 'potato' => false)
{"drink"=>true, "potato"=>false}
=> nil

# 第一引数にハッシュが来る時は()は省略できない
irb(main):038:0> def buy_burger(options = {}, menue)
irb(main):039:1>  puts options
irb(main):040:1> end
=> :buy_burger
irb(main):041:0> buy_burger({'drink' => true, 'potato' => false}, 'false')
{"drink"=>true, "potato"=>false}
=> nil

irb(main):042:0> currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
=> {:japan=>"yen", :us=>"dollar", :india=>"rupee"}
irb(main):043:0> currencies.to_a
=> [[:japan, "yen"], [:us, "dollar"], [:india, "rupee"]]
irb(main):044:0> array = [[:japan, "yen"], [:us, "dollar"], [:india, "rupee"]]
=> [[:japan, "yen"], [:us, "dollar"], [:india, "rupee"]]
irb(main):045:0> array.to_h
=> {:japan=>"yen", :us=>"dollar", :india=>"rupee"}
irb(main):046:0> array = [1,2,3,4]
=> [1, 2, 3, 4]
irb(main):047:0> array.to_h # できない

irb(main):048:0> array = [[:japan, 'yen'], [:japan, '円']]
=> [[:japan, "yen"], [:japan, "円"]]
irb(main):049:0> array.to_h
=> {:japan=>"円"}　# 重複するkeyがある場合は後ろが優先

rb(main):050:0> array = [[:japan, "yen"], [:us, "dollar"], [:india, "rupee"]]
=> [[:japan, "yen"], [:us, "dollar"], [:india, "rupee"]]
irb(main):051:0> Hash[array]
=> {:japan=>"yen", :us=>"dollar", :india=>"rupee"}

irb(main):054:0> h = {}
=> {}
irb(main):055:0> h[:foo]
=> nil
irb(main):056:0> h = Hash.new('hello')
=> {}
irb(main):057:0> h[:foo]
=> "hello" # キーがなければ初期値を返す

irb(main):064:0> h = Hash.new('hello')
=> {}
irb(main):065:0> a = h[:foo]
=> "hello"
irb(main):066:0> b = h[:bar]
=> "hello"
irb(main):067:0> a.equal?(b)
=> true
irb(main):068:0> a.upcase!
=> "HELLO"
# 破壊的な変更をするとbも変わってしまう
irb(main):069:0> b
=> "HELLO"

irb(main):072:0> h = Hash.new{ |hash, key| hash[key] = 'hello' }
=> {}
irb(main):073:0> h[:foo]
=> "hello"
irb(main):074:0> h[:bar]
=> "hello"
irb(main):075:0> h
=> {:foo=>"hello", :bar=>"hello"}

# 5.7 シンボルについてもっと詳しく
# ------------------------------------------------
# to_symメソッド
irb(main):098:0> string = 'apple'
=> "apple"
irb(main):099:0> symbol = :apple
=> :apple
irb(main):100:0> string.to_sym
=> :apple
irb(main):101:0> string.to_sym == symbol
=> true

# respond_to?メソッドは、指定した名前のメソッドを呼び出せるかをチェックしてくれる
# 文字列もシンボルも可能
irb(main):102:0> 'apple'.respond_to?('include?')
=> true
irb(main):103:0> 'apple'.respond_to?(:include?)
=> true

# include?は文字列だけ
irb(main):104:0> 'apple'.include?('pp')
=> true

# 5.8 この章のまとめ
# -------------------------------------
# \\= を使った自己代入
# 変数がfalseまたはnilの場合に代入してくれる
irb(main):105:0> limit = nil
=> nil
irb(main):106:0> limit ||= 10
=> 10
irb(main):107:0> limit
=> 10
irb(main):108:0> limit = 20
=> 20
irb(main):109:0> limit ||= 10
=> 20
irb(main):110:0> limit
=> 20
irb(main):111:0> limit = limit || 10
=> 20

# !!を使った真偽値の式転換
irb(main):112:0> !!true
=> true
irb(main):113:0> !!1
=> true
irb(main):114:0> !!false
=> false
irb(main):115:0> !!nil
=> false