class Answer < ApplicationRecord
  belongs_to :question

  validates :text, presence: true
  validate :validate_numder_of_answers, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_numder_of_answers
    errors.add(:question) if question.answers.count >= 4
  end

end
