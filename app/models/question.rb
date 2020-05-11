class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :text, presence: true

  validate :validate_numder_of_answers

  private

  def validate_numder_of_answers
    errors.add(:answers) if answers.length < 1 || answers.length > 4
  end

end
