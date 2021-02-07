class User < ActiveRecord::Base
    has_many :submissions
    validates :email, :username, uniqueness: true, presence: true
    validates :password, length: { in: 6..20 }
    # has_secure_password 
end