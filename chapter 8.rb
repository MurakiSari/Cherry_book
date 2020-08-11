# 8章　モジュールを理解する
#
# モジュールの用途
# ・継承を使わずにクラスにインスタンスメソッドを追加する、もしくは上書きする（ミックスイン）。
# ・複数のクラスに対して共通の特異メソッド（クラスメソッド）を追加する（ミックスイン）。
# ・クラス名や定数名の衝突を防ぐために名前空間を作る。・関数的メソッドを定義する。
# ・シングルトンオブジェクトのように扱って設定値などを保持する
#
# モジュールのミックス・イン
#
irb(main):162:0> class Product
  irb(main):163:1>   def title
    irb(main):164:2>     log 'title is called'
    irb(main):165:2>     'A greate movie'
    irb(main):166:2>   end
  irb(main):167:1>
      irb(main):168:1>   private
  irb(main):169:1>
      irb(main):170:1>   def log(text)
    irb(main):171:2>     puts "[LOG] #{text}"
    irb(main):172:2>   end
  irb(main):173:1> end
=> :log
irb(main):174:0> class User
  irb(main):175:1>   def name
    irb(main):176:2>     log 'name is called'
    irb(main):177:2>     'Alice'
    irb(main):178:2>   end
  irb(main):179:1>
      irb(main):180:1>   private
  irb(main):181:1>
      irb(main):182:1>   def log(text)
    irb(main):183:2>     puts '[LOG] #{text}'
    irb(main):184:2>   end
  irb(main):185:1> end
=> :log
irb(main):186:0> product = Product.new
irb(main):186:0> product.title
=> '[LOG]title is called'
irb(main):186:0> user = User.new
irb(main):186:0> user.name
=> '[LOG]name is called'

# どちらもログを出力することはでたが、ログを出力する処理は重複。しかし、コードが重複しているからといって安易に継承を使うのはNG。
# 「製品はユーザである」または「ユーザは製品である」という関係（isaの関係）が成り立たないのであれば、継承の使用は避けるべき。
# 継承は使えないが、「ログを出力する」という共通の機能は持たせたい、そんなときに選択肢として挙がるのがモジュール。

    irb(main):188:0> module Loggable
  irb(main):189:1>   def log(text)
    irb(main):190:2>     puts "[LOG] #{text}"
    irb(main):191:2>   end
  irb(main):192:1> end
=> :log
irb(main):193:0> class Product
  irb(main):194:1>   include Loggable
  irb(main):195:1>
      irb(main):196:1>   def title
    irb(main):197:2>     log 'title is called'
    irb(main):198:2>     'A greate movie'
    irb(main):199:2>   end
  irb(main):200:1> end
=> :title
irb(main):201:0> class User
  irb(main):202:1>   include Loggable
  irb(main):203:1>

    irb(main):205:2*   def name
      irb(main):206:2>     log'name is called'
      irb(main):207:2>     'Alice'
      irb(main):208:2>   end
    irb(main):209:1> end
  => :def

irb(main):186:0> product = Product.new
irb(main):186:0> product.title
=> '[LOG]title is called'
irb(main):186:0> user = User.new
irb(main):186:0> user.name
=> '[LOG]name is called'

# モジュールの　extend
# モジュールをクラスにミックスインするもうひとつの方法としてのextend。
# extendを使うと、モジュール内のメソッドをそのクラスの特異メソッド（つまりクラスメソッド）にすることができる。
#
irb(main):210:0> module Loggable
irb(main):211:1> def log(text)
irb(main):212:2>      puts "[LOG] #{text}"
irb(main):213:2>    end
irb(main):214:1> end
=> :log
irb(main):215:0>  class Product
irb(main):216:1> extend Loggable
irb(main):217:1>
irb(main):218:1>   def self.create_products(names)
irb(main):219:2>
irb(main):220:2>     log 'create_product is called'
irb(main):221:2>   end
irb(main):222:1> end
=> :create_products
irb(main):223:0>
irb(main):224:0> Product.create_products([])
[LOG] create_product is called
=> nil
irb(main):225:0> Product.log('Hello')
[LOG] Hello
=> nil

# ミックスインについてもっと詳しく
#
irb(main):230:0> module Loggable
  irb(main):231:1>
      irb(main):232:1> end
=> nil
irb(main):233:0> class Product
  irb(main):234:1>   include Loggable
  irb(main):235:1>
      irb(main):236:1> end
=> Product
irb(main):237:0> Product.include?(Loggable)
=> true
irb(main):238:0> Product.included_modules
=> [Loggable, Kernel]
irb(main):239:0> Product.ancestors
=> [Product, Loggable, Object, Kernel, BasicObject]

# Enumerableモジュール
# Enumerableモジュールは配列やハッシュ、範囲（Range）など、何かしらの繰り返し処理ができるクラスにincludeされているモジュール。
# Enumerableモジュールがincludeされていることは、以下のようにクラスに対してinclude?メソッどを呼び出すとわかる。
#
irb(main):241:0>
    irb(main):241:0> Array.include?(Enumerable)
=> true
irb(main):242:0> Hash.include?(Enumerable)
=> true
irb(main):243:0> Range.include?(Enumerable)
=> true
irb(main):244:0> [1,2,3].map { |n| n*10 }
=> [10, 20, 30]
irb(main):245:0> { a: 1, b: 2, c: 3 }.map { |k, v| [k, v * 10] }
=> [[:a, 10], [:b, 20], [:c, 30]]
irb(main):246:0> (1..3).map { |n| n * 10 }
=> [10, 20, 30]
irb(main):247:0> [1, 2, 3].count
=> 3
irb(main):248:0> { a: 1, b: 2, c: 3 }.count
=> 3
irb(main):249:0> (1..3).count
=> 3

# Comparableモジュール
#
# Comparableモジュールは比較演算を可能にする（つまり値の大小を識別できるようにする）モジュール
#　Comparableモジュールのメソッドを使えるようにするための条件は、include先のクラスで<=>演算子を実装しておくこと
#
#　<=>演算子はその形状から「UFO演算子」とも呼ばれる演算子で、a<=>bが次のような結果を返すように実装する必要があり
#
# ・aがbより大きいなら正の整数
# ・aとbが等しいなら0
# ・aがbより小さいなら負の整数
# ・aとbが比較できない場合はnil
#
irb(main):250:0> 2 <=> 1
=> 1
irb(main):251:0> 2 <=> 2
=> 0
irb(main):252:0> 1 <=> 2
=> -1
irb(main):253:0> 2 <=> 'abc'
=> nil
irb(main):254:0> 'xyz' <=> 'abc'
=> 1
irb(main):255:0> 'abc' <=> 'abc'
=> 0
irb(main):256:0> 'abc' <=> 'xyz'
=> -1
irb(main):257:0> 'abc' <=> 123
=> nil

# ・モジュールを利用した名前空間の作成
# ・関数や定数を提供するモジュールの作成
# ・状態を保持するモジュールの作成
#

