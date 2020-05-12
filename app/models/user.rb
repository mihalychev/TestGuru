class User < ApplicationRecord
  has_many :created_tests, inverse_of: 'author', class_name: 'Test', dependent: :destroy
  has_many :tests_users
  has_many :tests, through: :tests_users, dependent: :destroy

  validates :name, presence: true

  def tests_by_level(level)
    tests.where(level: level)
  end
end
