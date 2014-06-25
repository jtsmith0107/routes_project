class EnforceUniquenessContact < ActiveRecord::Migration
  def change
    add_index(:contacts, :name, :unique => true)
    add_index(:contacts, :email, :unique => true)
    
    change_column :contacts, :name, :string, :null => false
    change_column :contacts, :email, :string, :null => false
  end
end
