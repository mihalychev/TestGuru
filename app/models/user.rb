class User < ApplicationRecord
  has_many :users_completed_tests
  has_many :tests, through: :users_completed_tests

  def tests_by_level(level)
    Test
      .joins('JOIN user_completed_tests ON user_completed_tests.test_id = tests.id')
      .where(user_completed_tests: { user_id: id }, level: level)
  end
end
