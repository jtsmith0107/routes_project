class EnforceUniqueUserNameAndEmail < ActiveRecord::Migration
  def change
    add_index :users, :name, unique: true
    add_index :users, :email, unique: true
    change_column :users, :name, :string, :null => false
    change_column :users, :email, :string, :null => false
  end
end
