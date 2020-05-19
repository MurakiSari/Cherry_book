# 6章 正規表現を理解する
# ---------------------------------
# 6.1 イントロダクション
irb(main):001:0> { :name => 'Alice', :age => 20, :gender => :female }
=> {:name=>"Alice", :age=>20, :gender=>:female}
irb(main):002:0> { name: 'Alice', age: 20, gender: :female  }
=> {:name=>"Alice", :age=>20, :gender=>:female}
# irb(main):004:0> old_syntax = <<TEXT
irb(main):005:0" {
irb(main):006:0"  :name => 'Alice',
irb(main):007:0"  :age => 20.
irb(main):008:0"  :gender => :female
irb(main):009:0" }
irb(main):010:0" TEXT
=> "{\n :name => 'Alice',\n :age => 20.\n :gender => :female\n}\n"

# 6.2 正規表現って何？
# [] いずれか１文字を表す文字クラスを作る
# [^] ~以外の任意の一文字を表す文字クラスを作る
# - []内で使われる文字の範囲を表す
# . 任意の一文字を表す
# () 内部でマッチした文字列をキャプチャもしくはグループ化する
# ? 直前の文字列やパターンが１回、もしくは０回現れる
# * 直前の文字列やパターンが0回以上連続する
# + 直前の文字列やパターンが1回以上連続する
# {n,m} 直前の文字列やパターンがn回以上、m回以下連続する
# | OR条件を作る
# ^ 行頭を表す
# $ 行末を表す
# \ メタ文字をエスケープしたり、\nや\wと言ったの他のメタ文字の一部になったりする
# irb(main):012:0> text = <<TEXT
irb(main):013:0" I love Ruby.
irb(main):014:0" Python is great language
irb(main):015:0" Java and JavaScript are different.
irb(main):016:0" TEXT
=> "I love Ruby.\nPython is great language\nJava and JavaScript are different.\n"
irb(main):017:0> text.scan(/[A-Z][A-Za-z]+/)
=> ["Ruby", "Python", "Java", "JavaScript"]
# irb(main):018:0> text = <<TEXT
irb(main):019:0" 私の郵便番号は1234567です。
irb(main):020:0" 僕の住所は6770056 兵庫県西脇市だよ。
#irb(main):021:0" TEXT
=> "私の郵便番号は1234567です。\n僕の住所は6770056 兵庫県西脇市だよ。\n"
irb(main):022:0> puts text.gsub(/(\d{3})(\d{4})/,'\1-\2')
私の郵便番号は123-4567です。
僕の住所は677-0056 兵庫県西脇市だよ。
=> nil

# 6.3 Rubyにおける正規表現オブジェクト
#
irb(main):036:0> text = '私の誕生日は1977年7月17日です。'
=> "私の誕生日は1977年7月17日です。"
irb(main):037:0> m = /(\d)年(\d)月(\d)日/.match(text)
=> nil
m[1] 1977
m[2] 7
m[3] 17

irb(main):036:0> text = '私の誕生日は1977年7月17日です。'
=> "私の誕生日は1977年7月17日です。"
irb(main):037:0> m = /(\d)年(\d)月(\d)日/.match(text)

# 全部を取得する
m[0] 1977年7月17日
# 2番目から２個取得する
m[2] ['7', '17']
# 最後を取得
m[-1] '17'
# Rangeを使って取得
m[1..3] ['1977', '7', '17']

# 結果に名前をつける
text = '私の誕生日は1977年7月17日です。'
m =/(?<year>\d)年(?<month>\d)月(?<day>\d)日/.match(text)

m[:year] '1977'
m[:month] '7'
m[:day] '17'

m['year'] '1977'
m[2] '7'

# 左辺に正規表現をおいて、右辺に文字列をおいて =~ で繋ぐ
text = '私の誕生日は1977年7月17日です。'
if /(?<year>\d)年(?<month>\d)月(?<day>\d)日/ =~ text
  puts '#{year}/#{month}/#{day}'
end

'1977/7/17'


'1977年7月19日 1957年2月19日'.scan(/(\d)年(\d)月(\d)日/)
[['1977', '7', '19'], ['1957', '2', '19']]

# マッチするものが複数ある場合は最初のものが表示
text = '123-4567 456-7890'
text[/\d{3}-\d{4}/] => '123-4567'

text = '私の誕生日は1977年7月17日です。'
text[/(\d)年(\d)月(\d)日/] => '1977年7月17日'
# 3番目を取得する
text[/(\d)年(\d)月(\d)日/, 3] => '17'

# sliceメソッドは[]のエイリアス
text = '郵便番号は123-4567です'
text.slice(/\d{3}-\d{4}/) => '123-4567'

text = '私の誕生日は1977年7月17日です。'
text.slice(/(\d)年(\d)月(\d)日/, 3) => '17'

# splitメソッド
text = '123, 456-789'
text.split(',') => ['123','456-789']

# 6.4 Rubyのハッシュ記法
irb(main):006:0> old_syntax = <<TEXT
irb(main):007:0" {
irb(main):008:0" :name => 'Alice',
irb(main):009:0" :age => 20,
irb(main):010:0" :gender => :female
irb(main):011:0" }
irb(main):012:0" TEXT
=> "{\n:name => 'Alice',\n:age => 20,\n:gender => :female\n}\n"
irb(main):013:0> convert_hash_syntax(old_syntax)

# 6.5 正規表現オブジェクトについてもっと詳しく
キャプチャ参照

