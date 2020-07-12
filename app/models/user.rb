class User < ApplicationRecord
  has_many :created_tests, inverse_of: 'author', class_name: 'Test', dependent: :destroy
  has_many :test_passages
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :gists
  has_many :user_badges
  has_many :badges, through: :user_badges, dependent: :destroy

  validates :first_name, :last_name, presence: true

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def admin?
    is_a?(Admin)
  end
end
