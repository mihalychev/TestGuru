class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges, dependent: :destroy

  BADGES_RULES = {
    'Pass all tests of category': :complete_category,
    'Pass the test on the first try': :first_try,
    'Pass all tests of a certain level': :complete_level
  }
end
