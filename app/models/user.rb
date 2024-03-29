class User < ActiveRecord::Base
	has_secure_password
	attr_accessible :email, :fname, :lname, :password, :password_confirmation, :role
	validates :email, length: {:minimum => 3}
	validates_uniqueness_of :email

	has_many :comments 
	before_create { generate_token(:auth_token) }

	def generate_token(column)
	    begin
	      self[column] = SecureRandom.urlsafe_base64
	    end while User.exists?(column => self[column])
  	end

  	def send_password_reset
	  generate_token(:password_reset_token)
	  self.password_reset_sent_at = Time.zone.now
	  save!
	  UserMailer.password_reset(self).deliver
	end
end
