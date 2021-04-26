class Test < ApplicationRecord
  has_many :category
  has_many :user, through: :test_passages

  def self.titles_by_category(category)
    query = "JOIN categories ON tests.category_id = categories.id WHERE categories.title = #{ category }"

    self.joins(query).order('title desc').pluck(:title)
  end
end
