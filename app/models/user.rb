class User < ActiveRecord::Base
    has_many :submissions
    has_many :comments
    has_secure_password
    validates :password, length: { minimum: 6}
    validates :email, uniqueness: true, presence: true
    validates :username, uniqueness: true, presence: true
end