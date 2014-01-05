class Ownership < ActiveRecord::Base
  belongs_to :owner,
    inverse_of: :ownerships
  belongs_to :building,
    inverse_of: :ownerships
end
