class CreateTestsUsersJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :tests, column_options: { foreign_key: true } do |t|
      t.index [:user_id, :test_id], unique: true
      # t.index [:test_id, :user_id]
    end
  end
end
