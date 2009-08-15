class AddDeltaToAgendaItems < ActiveRecord::Migration
  def self.up
    add_column :agenda_items, :delta, :boolean, :default => true, :null => false
  end

  def self.down
    remove_column :agenda_items, :delta
  end
end
