class CreateOrganizations < ActiveRecord::Migration[8.0]
  def change
    create_table :organizations do |t|
      t.text :name, null: false
      t.references :created_by, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
