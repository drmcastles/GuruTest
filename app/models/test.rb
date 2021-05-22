class Test < ApplicationRecord

  belongs_to :category
  belongs_to :autor, class_name: 'User', foreign_key: :autor_id

  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 }

  scope :by_level, -> (level) { where(level: level) }
  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }

  scope :tests_by_category, -> (category) { joins(:category).
                                where(categories: {title: category}) }


  def self.by_category(category)
    tests_by_category(category).order(title: :desc).pluck(:title)
  end
end
