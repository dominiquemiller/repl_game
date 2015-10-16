class Calculate
  attr_accessor :bill, :percent, :people
  def initialize
     @bill = bill
     @percent = percent
     @people = people
  end

  def tip
    bill * percent
  end

  def total_bill
    bill + tip
  end

  def split
    bill / people
  end
end

calc = Calculate.new

puts "How much is your bill?"
calc.bill = gets.chomp.to_f

puts "How many people are paying?"
calc.people = gets.chomp.to_i

puts "What percent tip would you like?"
answer = gets.chomp.to_f
calc.percent = answer / 100


puts "Thank you for dining at Wyncafe!"
puts "********************************"
puts "You bill is      $#{calc.bill}"
puts "The tip is       $#{calc.tip}"
puts "The final total: $#{calc.total_bill}"
puts "Split total each $#{calc.split}"
puts "********************************"
puts "Thank you, have a nice day!"
