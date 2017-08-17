#  moving left, double the value of every second digit

# if total of t  his doubling operation is greater than 9 (e.g., 7 * 2 = 14), then sum the digits of the products (e.g., 10: 1 + 0 = 1, 14: 1 + 4 = 5).

# take the sum of all the digits

# if and only if the total modulo 10 is equal to 0 then the number is valid

# card_number = "4929735477250543"
#
# valid = false

require "pry"
 ccn = "4929735477250543"
# card_array = []
# card_array << card_number.to_s.split('')
# print card_array

def credit_card(ccn)
count = 0
answer = 0

  ccn.split("").reverse.each do | digit |
    if count.even?
      answer += digit.to_i
    elsif digit.to_i * 2 > 9
      double = digit.to_i * 2
      individual_num = double.to_s.split("")
      individual_num.each do | num |
      answer += num.to_i
      end
      answer
    else
      answer += digit.to_i * 2
    end
    count += 1
  end

  if answer % 10 == 0
    puts "The number is valid!"
  else
    puts "The number is invalid!"
  end
end

credit_card(ccn)
