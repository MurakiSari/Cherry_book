# 3章　テストを自動化する
# --------------------------------------
irb(main):001:0> def fizz_buzz(n)
irb(main):002:1>  if n % 15 == 0
irb(main):003:2>   'Fizz Buzz'
irb(main):004:2>  elsif n % 3 == 0
irb(main):005:2>   'Fizz'
irb(main):006:2>  elsif n % 5 == 0
irb(main):007:2>   'Buzz'
irb(main):008:2>  else
irb(main):009:2>   n.to_s
irb(main):010:2>  end
irb(main):011:1> end
=> :fizz_buzz
irb(main):012:0> require 'minitest/autorun'
=> true
irb(main):013:0> class FizzBuzzTest < Minitest::Test
irb(main):014:1>  def test_fizz_buzz
irb(main):015:2>   assert_equal '1', fizz_buzz(1)
irb(main):016:2>   assert_equal '2', fizz_buzz(2)
irb(main):017:2>   assert_equal 'Fizz', fizz_buzz(3)
irb(main):018:2>   assert_equal '4', fizz_buzz(4)
irb(main):019:2>   assert_equal 'Buzz', fizz_buzz(5)
irb(main):020:2>   assert_equal 'Fizz', fizz_buzz(6)
irb(main):021:2>   assert_equal 'Fizz Buzz', fizz_buzz(15)
irb(main):022:2>  end
irb(main):023:1> end
=> :test_fizz_buzz
