class Question < ApplicationRecord

   has_many :answers

   def change_hard(level)

  validates :body,
            :test_id,
            presence: true

  validates :answers, length: { minimum: 1, maximum: 4 }

end
