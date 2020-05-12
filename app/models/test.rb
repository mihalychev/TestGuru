class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  
  has_many :tests_users
  has_many :users, through: :tests_users, dependent: :destroy
  has_many :questions, dependent: :destroy

  validates :level, numericality: { 
                      only_integer: true,
                      greater_than_or_equal_to: 0
                    }
  validates :title, presence: true,
                    uniqueness: {
                      scope: :level,
                      message: 'test with this name and level is already exist!'
                    }

  scope :easy,   -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard,   -> { where(level: 5..Float::INFINITY) }

  scope :test_names, -> (category_title) {
    joins(:category)
      .where(categories: { title: category_title })
      .order(id: :desc)
  }

  def self.tests_by_category(category_title)
    test_names(category_title).pluck(:title)
  end
end
