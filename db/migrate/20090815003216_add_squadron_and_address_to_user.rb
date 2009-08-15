class AddSquadronAndAddressToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :squadron_name, :string
    add_column :users, :squadron_address, :string
  end

  def self.down
    remove_column :users, :squadron_address
    remove_column :users, :squadron_name
  end
end
