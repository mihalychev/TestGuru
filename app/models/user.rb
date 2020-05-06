class User < ApplicationRecord
  # has_and_belongs_to_many :tests
  has_many :created_tests, inverse_of: 'author', class_name: 'Test', dependent: :restrict_with_exception
  has_many :tests_users, dependent: :restrict_with_exception
  has_many :tests, through: :tests_users, dependent: :restrict_with_exception

  def tests_by_level(level)
    tests.where(level: level)
  end
end
