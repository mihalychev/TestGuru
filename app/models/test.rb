class Test < ApplicationRecord
  has_many :users_completed_tests
  has_many :users, through: :users_completed_tests
  
  def self.test_names(category_title)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: category_title })
      .order(id: :desc)
      .pluck(:title)
  end
end
