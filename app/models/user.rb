class User < ApplicationRecord
  has_many :created_tests, inverse_of: 'author', class_name: 'Test', dependent: :destroy
  has_many :test_passages
  has_many :tests, through: :test_passages, dependent: :destroy

  validates :name, presence: true

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end
end
