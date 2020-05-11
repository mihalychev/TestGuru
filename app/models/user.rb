class User < ApplicationRecord
  # has_and_belongs_to_many :tests
  has_many :created_tests, inverse_of: 'author', class_name: 'Test', dependent: :destroy
  has_many :tests_users
  has_many :tests, through: :tests_users, dependent: :destroy

  validates :name, presence: true

  scope :tests_level, -> (tests, level) { tests.where(level: level) } 

  def tests_by_level(level)
    self.class.tests_level(tests, level)
  end
end
