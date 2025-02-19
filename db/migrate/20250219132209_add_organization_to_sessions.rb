class AddOrganizationToSessions < ActiveRecord::Migration[8.0]
  def change
    add_reference :sessions, :organization, foreign_key: true
  end
end
