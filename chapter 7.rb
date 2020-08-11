# 7章 クラスの作成を理解する
user << { first_name: 'Alice', last_name: 'Ruby', age: 20 }
=> [{:first_name=>"Alice", :last_name=>"Ruby", :age=>20}]
irb(main):003:0> user << { first_name: 'Bob', last_name: 'Python', age: 30 }
=> [{:first_name=>"Alice", :last_name=>"Ruby", :age=>20}, {:first_name=>"Bob", :last_name=>"Python", :age=>30}]
irb(main):004:0> user.each do |user|
  irb(main):005:1* puts "name: #{user[:first_name]} #{user[:last_name]} old: #{user[:age]}"
  irb(main):006:1> end
name: Alice Ruby old: 20
name: Bob Python old: 30
=> [{:first_name=>"Alice", :last_name=>"Ruby", :age=>20}, {:first_name=>"Bob", :last_name=>"Python", :age=>30}]

irb(main):011:0>  users = []
=> []
irb(main):012:0> users << { first_name: 'Alice', last_name: 'Ruby', age: 20 }
=> [{:first_name=>"Alice", :last_name=>"Ruby", :age=>20}]
irb(main):013:0> users << { first_name: 'Bob', last_name: 'Python', age: 30 }
=> [{:first_name=>"Alice", :last_name=>"Ruby", :age=>20}, {:first_name=>"Bob", :last_name=>"Python", :age=>30}]
irb(main):014:0> def full_name(user)
  irb(main):015:1> "#{user[:first_name]} #{user[:last_name]}"
  irb(main):016:1>  end
=> :full_name
irb(main):017:0> users.each do |user|
  irb(main):018:1* puts "name: #{full_name(user)} , old: #{user[:age]}"
  irb(main):019:1> end
name: Alice Ruby , old: 20
name: Bob Python , old: 30
=> [{:first_name=>"Alice", :last_name=>"Ruby", :age=>20}, {:first_name=>"Bob", :last_name=>"Python", :age=>30}]

irb(main):020:0> users[0]
=> {:first_name=>"Alice", :last_name=>"Ruby", :age=>20}
irb(main):021:0> users[0][:first_name]
=> "Alice"
# ハッシュだとタイプミスしてもnilが返り、不具合に気付きにくい
irb(main):022:0> users[0][:first_mame]
=> nil

# ハッシュは新しくキーを追加・変更できるので脆くて壊れやすいプログラム
irb(main):005:0> users = []
=> []
irb(main):006:0> users << { first_name: 'Alice', last_name: 'Ruby', age: 20 }
=> [{:first_name=>"Alice", :last_name=>"Ruby", :age=>20}]
irb(main):007:0> users << { first_name: 'Bob', last_name: 'Python', age: 30 }
=> [{:first_name=>"Alice", :last_name=>"Ruby", :age=>20}, {:first_name=>"Bob", :last_name=>"Python", :age=>30}]
irb(main):008:0> users[0]
=> {:first_name=>"Alice", :last_name=>"Ruby", :age=>20}
irb(main):009:0> users[0][:country]
=> nil
irb(main):010:0> users[0][:country] = 'japan'
=> "japan"
irb(main):011:0> users[0][:first_name] = 'Carol'
=> "Carol"
irb(main):012:0> users[0]
=> {:first_name=>"Carol", :last_name=>"Ruby", :age=>20, :country=>"japan"}

irb(main):021:0> class User
irb(main):022:1> attr_reader :first_name, :last_name, :age
irb(main):023:1>   def initialize(first_name, last_name, age)
irb(main):024:2>     @first_name = first_name
irb(main):025:2>     @last_name = last_name
irb(main):026:2>     @age = age
irb(main):027:2>   end
irb(main):028:1> end
=> :initialize
irb(main):029:0> users = []
=> []
irb(main):030:0> users << User.new("Alice", "Ruby", 20)
=> [#<User:0x00007ff0c98fb760 @first_name="Alice", @last_name="Ruby", @age=20>]
irb(main):031:0> users << User.new("Bob", "Python", 30)
=> [#<User:0x00007ff0c98fb760 @first_name="Alice", @last_name="Ruby", @age=20>, #<User:0x00007ff0ca0c9aa0 @first_name="Bob", @last_name="Python", @age=30>]
irb(main):032:0>
irb(main):033:0> def full_name(user)
irb(main):034:1>   "#{user.first_name} #{user.last_name}"
irb(main):035:1> end
=> :full_name
irb(main):036:0> users[0]
=> #<User:0x00007ff0c98fb760 @first_name="Alice", @last_name="Ruby", @age=20>
irb(main):037:0> users.each do |user|
irb(main):038:1*  puts "name: #{full_name(user), old: #{user.age}}"
irb(main):039:0> end
=> # name: Alice Ruby, old 20
# name: Bb Python, old 30
#
irb(main):045:0> users[0]
=> #<User:0x00007ff0c98fb760 @first_name="Alice", @last_name="Ruby", @age=20>
irb(main):046:0> users[0].first_name
=> "Alice"
irb(main):047:0> users[0].first_mame
Traceback (most recent call last):
4: from /usr/bin/irb:23:in `<main>'
    3: from /usr/bin/irb:23:in `load'
    2: from /Library/Ruby/Gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
1: from (irb):47
NoMethodError (undefined method "first_mame" for #<User:0x00007ff0c98fb760>)
Did you mean?  first_name
# クラスだとタイプミスでもちゃんとエラーを出してくれる

# -----------------------------------
# クラスインスタンス変数

irb(main):078:0> class Product
irb(main):079:1>   @name = "Product"
irb(main):080:1>    def self.name
irb(main):081:2>      @name  # クラスインスタンス変数
irb(main):082:2>    end
irb(main):083:1>
irb(main):084:1>    def initialize(name)
irb(main):085:2>       @name = name # インスタンス変数
irb(main):086:2>    end
irb(main):087:1>
irb(main):088:1>    def name
irb(main):089:2>      @name  # インスタンス変数
irb(main):090:2>     end
irb(main):091:1>  end
=> :name
irb(main):092:0>  Product.name
=> "Product"
irb(main):093:0> product = Product.new("A greate movie")
=> #<Product:0x00007ff0c9899790 @name="A greate movie">
irb(main):094:0> product.name
=> "A greate movie"
irb(main):095:0>  Product.name
=> "Product"

irb(main):096:0> class DVD < Product
irb(main):097:1>   @name = 'DVD'
irb(main):098:1>
irb(main):099:1>   def self.name
irb(main):100:2>     @name
irb(main):101:2>   end
irb(main):102:1>
irb(main):103:1>   def upcase_name
irb(main):104:2>     @name.upcase
irb(main):105:2>   end
irb(main):106:1> end
=> :upcase_name
irb(main):107:0> Product.name
=> "Product"
irb(main):108:0> DVD.name
=> "DVD"
irb(main):109:0> product = Product.new("A greate movie")
=> #<Product:0x00007ff0ca0cafb8 @name="A greate movie">
irb(main):110:0> product.name
=> "A greate movie"
irb(main):111:0> dvd = DVD.new("Anawesame film")
=> #<DVD:0x00007ff0ca0dbf98 @name="Anawesame film">
irb(main):112:0> dvd.name
=> "Anawesame film"
irb(main):113:0> dvd.upcase_name
=> "ANAWESAME FILM"
irb(main):114:0> Product.name
=> "Product"
irb(main):115:0> DVD.name
=> "DVD"
# インスタンス変数は継承関係に応じてスーパークラスとサブクラスで変数の内容が共有されますが、クラスインスタンス変数はスーパークラスとサブクラスでそれぞれ別々に内容が管理されます。

# クラス変数

irb(main):116:0> class Product
irb(main):117:1>   @@name = "Product"
irb(main):118:1>
irb(main):119:1>   def self.name
irb(main):120:2>      @@name
irb(main):121:2>   end
irb(main):122:1>
irb(main):123:1>   def initialize(name)
irb(main):124:2>     @@name = name
irb(main):125:2>   end
irb(main):126:1>
irb(main):127:1>   def name
irb(main):128:2>     @@name
irb(main):129:2>   end
irb(main):130:1> end

irb(main):138:0> class DVD < Product
irb(main):139:1>   @@name = 'DVD'
irb(main):140:1>
irb(main):141:1>   def self.name
irb(main):142:2>     @@name
irb(main):143:2>   end
irb(main):144:1>
irb(main):145:1>   def upcase_name
irb(main):146:2>     @@name.upcase
irb(main):147:2>   end
irb(main):148:1> end
=> :upcase_name

irb(main):149:0> Product.name
=> "DVD"
irb(main):150:0> DVD.name
=> "DVD"
irb(main):151:0> product = Product.new("A greate movie")
=> #<Product:0x00007ff0bb883b60>
irb(main):152:0>
irb(main):153:0> product.name
=> "A greate movie"
irb(main):154:0> Product.name
=> "A greate movie"
irb(main):155:0> DVD.name
=> "A greate movie"
irb(main):156:0> dvd = DVD.new("Anawesame film")
=> #<DVD:0x00007ff0ca13b768>
irb(main):157:0> dvd.name
=> "Anawesame film"
irb(main):158:0> dvd.upcase_name
=> "ANAWESAME FILM"
irb(main):159:0> product.name
=> "Anawesame film"
irb(main):160:0> Product.name
=> "Anawesame film"
irb(main):161:0> DVD.name
=> "Anawesame film"
# @@nameはクラスメソッド内でもインスタンスメソッド内でも共有される。
# またスーパークラスとサブクラスの間でも共有されている。 そのため、@@nameの内容が変更されるとほかのクラスやほかのインスタンスのメソッドも実行結果が変わっている。

