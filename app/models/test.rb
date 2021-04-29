class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  has_many :test_passages
  has_many :user, through: :test_passages

  scope :by_level, -> (level) { where(level: level) }
  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }

  scope :tests_by_category, -> (category) { joins(:category).
  where(categories: {title: category}) }

  scope :order_desc, -> { order(title: :desc) }

  validates :title, presence: true, uniqueness: {scope: :level}
  validates :level, numericality: {only_integer: true,
                                   greater_than_or_equal_to: 0}

  def self.by_category(category)
    tests_by_category(category).order(title: :desc).pluck(:title)
  end

  end
end
