class Test < ApplicationRecord
  has_many :category
  has_many :user, through: :test_passages
end
