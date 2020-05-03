class Test < ApplicationRecord
  def self.test_names(category_title)
    Test.joins('JOIN categories ON tests.category_id = categories.id').where(categories: { title: category_title}).order(id: :desc).pluck(:title)
  end
end
