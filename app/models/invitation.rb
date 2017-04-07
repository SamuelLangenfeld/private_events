class Invitation < ApplicationRecord
  attr_accessor :attendee_name

  belongs_to :event
  belongs_to :attendee, :class_name => 'User'
  validates :event, uniqueness: {scope: :attendee}

  
end
