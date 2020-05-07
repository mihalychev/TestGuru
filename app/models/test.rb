class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  
  # has_and_belongs_to_many :users
  has_many :tests_users
  has_many :users, through: :tests_users, dependent: :destroy
  has_many :questions, dependent: :destroy
  
  def self.test_names(category_title)
    joins(:category)
      .where(categories: { title: category_title })
      .order(id: :desc)
      .pluck(:title)
  end
end
