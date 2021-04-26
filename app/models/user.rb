class User < ApplicationRecord
  has_many :tests, through: :test_passages

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
