class Article < ApplicationRecord
  #enforces an artist entry into Article database
  validates :artist, presence: true, length: { minimum: 3, maximum: 50 }
  #enforces an album entry into Article database
  validates :album, presence: true
  #enforces an description entry into Article database, with minimum 20, max 300 charater entry 
  validates :description, presence: true, length: { minimum: 20, maximum: 300 } 
end
