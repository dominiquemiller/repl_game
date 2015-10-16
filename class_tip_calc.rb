class Calculate
  attr_accessor :bill, :tip, :tip_percent, :total_bill, :people
  def initialize(bill=0, tip=0, tip_percent=0, total_bill=0)
     @bill = bill
     @tip = tip
     @tip_percent = tip_percent
     @total_bill = total_bill
     @people = people

  end

  # def total
  #   tip_calc.total_bill = ( tip_calc.bill *  tip_calc.tip_percent)/ tip_calc.people
  #  end
end

tip_calc = Calculate.new

puts "How much is your bill?"
tip_calc.bill = gets.chomp.to_f

puts "How many people are paying?"
tip_calc.people = gets.chomp.to_i

puts "What percent tip would you like?"
answer = gets.chomp.to_f
tip_calc.tip_percent = answer / 100

tip_amount = ( tip_calc.bill *  tip_calc.tip_percent)
tip_calc.total_bill = tip_calc.bill + tip_amount
split = tip_calc.total_bill / tip_calc.people

puts "Thank you for dining at Wyncafe!"
puts "********************************"
puts "You bill is      $#{ tip_calc.bill}"
puts "The tip is       $#{ tip_amount}"
puts "The final total: $#{ tip_calc.total_bill}"
puts "Split total each $#{split}"
puts "********************************"
puts "Thank you, have a nice day!"
