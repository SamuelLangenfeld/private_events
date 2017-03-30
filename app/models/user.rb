class User < ApplicationRecord
	before_create :create_remember_token
	attr_accessor :remember_token
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :name, presence: true, length: {maximum: 50}
	validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
	before_save :downcase_email
	has_many :events, :foreign_key => :host_id, dependent: :destroy


	def User.new_token
		SecureRandom.urlsafe_base64
	end

	def remember
		self.remember_token= User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	def forget
		update_attribute(:remember_digest, nil)
	end

	def User.digest(string)
		cost= ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
													 BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end







	private
		def downcase_email
			self.email.downcase!
		end

		def create_remember_token

		end



end
