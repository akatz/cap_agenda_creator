class AgendaItem < ActiveRecord::Base
  belongs_to :agenda
  validates_presence_of :activity_name, :start_time, :end_time
  validates_presence_of :agenda_id
 
  define_index do
    indexes activity_name
    
    set_property :delta => true
  end

   private

   def validate
     return unless start_time and end_time

     errors.add_to_base "Activity starts after it ends"             if start_time > end_time
     errors.add_to_base "Activity starts and ends at the same time" if start_time == end_time

   end



end
