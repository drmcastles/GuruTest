class Question < ApplicationRecord

   has_many :answers

   def change_hard(level)

  case level
    when 0..1
       puts "Easy"
    when 2..4
      puts "SREDNE"
    when 5..Float::INFINITY
      puts "Hard!"

   end
end
