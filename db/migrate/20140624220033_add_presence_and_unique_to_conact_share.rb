class AddPresenceAndUniqueToConactShare < ActiveRecord::Migration
  def change
    add_index(:contact_shares, [:contact_id, :user_id], :unique => true)
    change_column(:contact_shares, :contact_id, :integer, :null => false)
    change_column(:contact_shares, :user_id, :integer, :null => false)
  end
end
