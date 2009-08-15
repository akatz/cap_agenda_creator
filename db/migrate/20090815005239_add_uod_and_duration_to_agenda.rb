class AddUodAndDurationToAgenda < ActiveRecord::Migration
  def self.up
    add_column :agendas, :uod, :string
    add_column :agendas, :duration, :float
  end

  def self.down
    remove_column :agendas, :duration
    remove_column :agendas, :uod
  end
end
