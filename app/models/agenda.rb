class Agenda < ActiveRecord::Base
  has_many :agenda_items
  belongs_to :user
end
