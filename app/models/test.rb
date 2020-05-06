class Test < ApplicationRecord
  # has_and_belongs_to_many :users
  has_many :tests_users
  has_many :users, through: :tests_users
  has_many :questions

  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  
  def self.test_names(category_title)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: category_title })
      .order(id: :desc)
      .pluck(:title)
  end
end
