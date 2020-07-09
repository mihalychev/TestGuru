class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges, dependent: :destroy

  validates :title, :image_url, presence: true
  validates :rule, inclusion: { in: BadgeService::BADGE_RULES.map(&:to_s) }
  validates :rule, uniqueness: { scope: :value, message: 'Badge with these parameters is already exist' }
end
