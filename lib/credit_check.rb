class CreditCheck
  attr_reader :card_number,
              :valid

  def initialize(card_number)
    @card_number = card_number
    @valid       = false
  end

  def validate
    formatted_card = separate_card_digits(@card_number)
    summed_digits  = find_odd_digits(formatted_card)
    outcome        = check(summed_digits)
    result(outcome)
  end

  def separate_card_digits(card_number)
    card_number.to_i.digits
  end

  def find_odd_digits(split_numbers)
    split_numbers.map.with_index do |digit, index|
      double_odd_digits(digit, index)
    end.sum
  end

  def double_odd_digits(digit, index)
    if index.odd?
      double_the_numbers(digit)
    else
      digit
    end
  end

  def double_the_numbers(num)
    if (num * 2) > 9
      (num * 2).digits.sum
    else
      num * 2
    end
  end

  def check(num)
    @valid = true if num % 10 == 0
  end

  def result(num)
    puts @card_number
    puts "The number is valid!" if valid == true
    puts "The number is invalid!" if valid == false
  end
end

valid_numbers   = ["5541808923795240", "4024007136512380", "6011797668867828"]
invalid_numbers = ["5541801923795240", "4024007106512380", "6011797668868728"]

puts "Valid numbers"
valid_numbers.each  { |card_number| CreditCheck.new(card_number).validate }
puts "Invalid numbers"
invalid_numbers.each  { |card_number| CreditCheck.new(card_number).validate }

puts "Valid AMEX"
CreditCheck.new("342804633855673").validate

puts "Invalid AMEX"
CreditCheck.new("342801633855673").validate
