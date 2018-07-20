class Article < ApplicationRecord
  belongs_to :user #receives one to many association with user
  #enforces an artist entry into Article database
  validates :artist, presence: true, length: { minimum: 1, maximum: 50 }
  #enforces an album entry into Article database
  validates :album, presence: true
  #enforces an description entry into Article database, with minimum 20, max 300 charater entry 
  validates :description, presence: true, length: { minimum: 20, maximum: 300 } 
  #enforces the presence of a user ID
  validates :user_id, presence: true
end
