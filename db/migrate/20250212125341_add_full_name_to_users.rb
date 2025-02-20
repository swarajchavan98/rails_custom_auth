class AddFullNameToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :full_name, :text, null: false
  end
end
