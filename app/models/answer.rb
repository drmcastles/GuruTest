class Answer < ApplicationRecord

  belongs_to :question

  scope :correct, -> { where correct: true }

  validates :body,
            :correct,
            :question_id,
            presence: true
end
