class Article < ApplicationRecord
  validates :artist, presence: true  #enforces an artist entry into Article database
  validates :album, presence: true  #enforces an album entry into Article database
  
end