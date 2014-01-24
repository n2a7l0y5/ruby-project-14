# Project 14:

# 1. Study up on Ruby Unit tests.
# 2. Create a test for your project from Project 11 using Ruby Test::Unit
# 3. Your test script should test the basic functionality of your program.
# 4. Write enough tests to test the basic functionality of your program. I.e. transfers, deposits, account balances, etc..

class Account
   attr_accessor :balance, :account_holder
    def initialize
     @balance = 0
    end
    def deposit(amount)
     @balance += amount
    end

    def withdraw(amount)
     @balance -= amount
    end

    def self.transfer(amount, from_account, to_account)
      from_account.withdraw(amount)
      to_account.deposit(amount)
    end
end

require "test/unit"

class TestAccount < Test::Unit::TestCase

  def setup
    @account_holder = Account.new
  end
  
  def test_deposit
    a = Account.new
    a.account_holder = "Steve"
    a.deposit(100)
    b = Account.new
    b.account_holder = "Jeron"
    b.deposit(4000)
    assert_equal 100, a.balance
    assert_equal 4000, b.balance
  end
  def test_withdraw
    a = Account.new
    a.account_holder = "Steve"
    a.withdraw(25)
    assert_equal -25, a.balance
  end
  def test_transfers
    a = Account.new
    a.account_holder = "Steve"
    a.balance
    a.withdraw(50)
    b = Account.new
    b.account_holder = "Jeron"
    b.deposit(4050)
    b.balance
    assert_equal -50, a.balance
    assert_equal 4050, b.balance
  end
end
# => Finished tests in 0.000633s, 4739.3365 tests/s, 7898.8942 assertions/s.
# 3 tests, 5 assertions, 0 failures, 0 errors, 0 skips


# Resources:
# http://en.wikibooks.org/wiki/Ruby_Programming/Unit_testing
# http://en.wikipedia.org/wiki/Unit_testing_frameworks_for_Ruby
# http://www.developerfusion.com/article/84444/unit-testing-in-ruby/
# http://test-unit.rubyforge.org/
# http://stackoverflow.com/questions/9838988/ruby-unit-tests-run-some-code-after-each-failed-test


