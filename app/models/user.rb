class User < ActiveRecord::Base
	has_many :posts
	before_save{self.email = email.downcase}
	before_save :format_name
	validates :name, length: {minimum: 1, maximum: 100}, presence: true
	validates :password, presence: true, length: {minimum: 6}, if: "password_digest.nil?"
	validates :password, length: {minimum: 6}, allow_blank: true
	validates :email, presence: true, uniqueness: {case_sensitive: false}, length:{minimum: 3, maximum: 254}

	has_secure_password
end

def format_name
	if self.name
		name_arr = []
		self.name.split.each do |fl|
			name_arr << fl.capitalize
		end
		self.name = name_arr.join(" ")
	end
end
