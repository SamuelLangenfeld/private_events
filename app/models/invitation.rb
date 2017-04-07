class Invitation < ApplicationRecord
  belongs_to :event
  belongs_to :attendee, :class_name => 'User'
  before_save :not_accepted

  attr_accessor :attendee_name


  private
  def not_accepted
    self.accepted = false
  end
  

  
end
