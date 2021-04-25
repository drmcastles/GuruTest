class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
end
