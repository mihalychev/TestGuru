class AddNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:tests, :title, false)
    change_column_null(:questions, :text, false)
    change_column_null(:answers, :text, false)
    change_column_null(:users, :email, false)
    change_column_null(:categories, :title, false)
  end
end
