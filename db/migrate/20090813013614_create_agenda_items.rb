class CreateAgendaItems < ActiveRecord::Migration
  def self.up
    create_table :agenda_items do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :activity_name
      t.string :oic
      t.integer :agenda_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :agenda_items
  end
end
