class Answer < ApplicationRecord
  belongs_to :question

  validates :text, presence: true

  scope :correct_answers, -> { where(correct: true) }
end
