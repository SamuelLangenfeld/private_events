class Event < ApplicationRecord
	belongs_to :host, class_name: 'User'
	has_many :invitations, dependent: :destroy
	has_many :attendees,->{where invitations:{accepted:true}}, class_name: 'User', :through=> :invitations 
	validates :title, presence: true, length: {maximum: 50}
	validates :description, presence: true
	validates :location, presence: true

	scope :past_events, ->{where("date_and_time< ?", Time.zone.now)}
	scope :upcoming_events, ->{where("date_and_time >?", Time.zone.now)}

end
