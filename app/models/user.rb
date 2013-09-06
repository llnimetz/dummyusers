# require 'bcrypt'

class User < ActiveRecord::Base
  # include BCrypt
  validates :password_hash, :presence =>  { :message => "Password required" }
  validates :password_hash, length: { minimum: 2,
            :message => "Password required" }
  validates :email, :presence => { :message => "Email required" }
  validates :email, :uniqueness => { :message => "Sorry that email is already in use" }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
            :message => "Please enter a valid email" }  

  # before_save :validate_data


  # def self.authenticate(email,password)
  # 	if self.email = email && self.password = password_hash
  # 		# ????????????
  # end

  # def validate_data
  # 	self.validate?
  # 	# ????????????????
  # end

  # def password
  #   @password ||= Password.new(password_hash)
  # end

  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end
end
