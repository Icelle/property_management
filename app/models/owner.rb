class Owner < ActiveRecord::Base
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates :email, presence:true, email:true

  has_many :buildings
end
