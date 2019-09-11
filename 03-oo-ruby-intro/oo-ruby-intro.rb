
# Everything in Ruby is an Object
#   - What is an object?
#   - Why does it that important?

# Methods as messages

# String is just an object that knows how to repond to certain message

# known messages + kinds of data = Class
# String =/= Integer : Strings and Integers don't respond to the same messages

# Store Bank Information

class BankAccount

  attr_accessor :balance, :owner

  # Class variable
  @@bank = "Bank's Bank"

  def initialize(owner, balance)
    self.owner = owner
    self.balance = balance
  end

  def to_s
    self.owner
  end

  def self.bank
    @@bank
  end

end

# [ _ _ _ _ | _ _ _ _ ]
# [ [ _ _ _ _ | _ _ _ _ ] | _ _ _ _ ]
# inheritance

puts BankAccount.new("asdf", 1234).to_s
