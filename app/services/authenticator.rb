class Authenticator
	def self.encryptor
		PasswordEncryptor
	end
	def self.repository
		User
	end
	def self.authenticate(name, password)
		user = repository.find_by(name: name)
		
		return unless user

		user if encryptor.valid?(user.password_hash, password)
	end
end