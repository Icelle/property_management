class Owner < ActiveRecord::Base
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_uniqueness_of [:first_name, :last_name, :email]
  validates :email, presence:true, email:true

  has_many :buildings
  has_many :ownerships, dependent: :destroy
  has_many :buildings, through: :ownerships

  # @return [Array] collection of owners with first name, last name
  def self.print_owners
    Owner.all.map {|owner| owner.first_name + " " + owner.last_name}
  end
end
