class Event < ApplicationRecord
	belongs_to :host, class_name: 'User'
	has_many :invitations, dependent: :destroy
	has_many :attendees, class_name: 'User', :through=> :invitations
	validates :title, presence: true, length: {maximum: 50}
	validates :description, presence: true

end
