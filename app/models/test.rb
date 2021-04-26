class Test < ApplicationRecord
  belongs_to: category
  has_many :test_passages
  has_many :user, through: :test_passages

  def self.titles_by_category(name)
    joins(:category).where(categories: { title: name }).pluck(:title)
  end
end
