class User < ApplicationRecord
	attr_reader :password 
	has_many :bookings

	validates :password, presence: {:if => :require_password?}

	def password=(password)
		if password.blank?
			@validate_password = false
		else
			self.password_hash = PasswordEncryptor.encrypt(password.to_s)
			@validate_password = true
			@password = password
		end
	end

	private
	def require_password?
		new_record? || @validate_password
	end

end
