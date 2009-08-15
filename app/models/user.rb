class User < ActiveRecord::Base
  acts_as_authentic
  has_many :agendas
  
  has_attached_file :logo
end
