class User < ActiveRecord::Base
	has_and_belongs_to_many :chats
	has_many :friendships
	has_many :friends, through: :friendships
	before_save {self.email = email.downcase}
	before_create :create_remember_token
	validates :name, presence: true, length: {maximum: 50}
	#validates :group, presence: true
	VALID_EMAIL_REGEX = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
	validates :email, presence: true, format: {with: VALID_EMAIL_REGEX},
		uniqueness: {case_sensitive: false}
	has_secure_password
	validates :password, length: {minimum: 6} 

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end
	
	def User.digest(token)
		Digest::SHA1.hexdigest(token.to_s)
	end
	
	private 
		def create_remember_token
			self.remember_token = User.digest(User.new_remember_token)	
		end
end
