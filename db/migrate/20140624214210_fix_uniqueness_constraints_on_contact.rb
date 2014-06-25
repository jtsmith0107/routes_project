class FixUniquenessConstraintsOnContact < ActiveRecord::Migration
  def change
    remove_index(:contacts, column: :name)
    remove_index(:contacts, column: :email)
    add_index(:contacts, [:user_id, :email], :unique => true)
    change_column(:contacts, :user_id, :integer, :null => false)
  end
end
