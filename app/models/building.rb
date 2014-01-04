class Building < ActiveRecord::Base
  include ApplicationHelper
  validates_presence_of :street
  validates_presence_of :city
  validates :state, presence:true, inclusion: { in: US_STATES }
  validates_format_of :postal_code, with:/\A\d{5}-\d{4}|\A\d{5}\z/, message: "Should be 12345 or 12345-1234"

  belongs_to :user,
    inverse_of: :buildings

  has_many :owners
end
