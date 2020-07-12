class AddRuleToBadges < ActiveRecord::Migration[6.0]
  def change
    add_column :badges, :rule, :string
  end
end
