class User < ApplicationRecord
    has_many :books 
    has_secure_password
    validates :username, uniqueness: true, presence: true, length: {minimum: 4, maximum: 60} 
    validates :email, uniqueness: true, presence: true, length: {minimum: 6, maximum: 60}, format: { with: URI::MailTo::EMAIL_REGEXP } 
end