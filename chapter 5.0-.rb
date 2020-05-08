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
