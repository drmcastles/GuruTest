class User < ApplicationRecord
  has_many :tests, through: :test_passages
end
