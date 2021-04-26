class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  def tests_by_level(level)

    Test.joins("LEFT JOIN users ON users.id = user_tests.user_id")
    .where(level: level, user_tests: { user_id: id })
  end
end
