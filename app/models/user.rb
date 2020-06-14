class User < ApplicationRecord
  has_many :created_tests, inverse_of: 'author', class_name: 'Test', dependent: :destroy
  has_many :test_passages
  has_many :tests, through: :test_passages, dependent: :destroy

  has_secure_password

  validates :email, 
            presence: true,
            uniqueness: true,
            format: { with: /\A^([A-z0-9][._-]?)+@([A-z0-9][-A-z0-9]+\.)+[A-z]{2,4}$\z/ }

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end
end
