class RenameCreatedByInOrganizations < ActiveRecord::Migration[8.0]
  def change
    rename_column :organizations, :created_by_id, :created_by
  end
end
