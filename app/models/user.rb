class User < ApplicationRecord
   #ensures a username is present, is unique, case sensitive and 
  validates :username, presence: true, uniqueness: {case_sensitive: false},
              #has a min and max length. 
              length: { minimum: 3, maximum: 25} 
   #sets email format  restrictions
  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   #ensures an email address is present, is unique, case 
   #sensitive, has a min and max length, and is verified. 
  validates :email, presence: true, length: { maximum: 105 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
             
  
end