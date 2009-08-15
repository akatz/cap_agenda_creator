class AddUserIdToAgenda < ActiveRecord::Migration
  def self.up
    add_column :agendas, :user_id, :integer
  end

  def self.down
    remove_column :agendas, :user_id
  end
end
