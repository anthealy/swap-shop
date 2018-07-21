class Type < ApplicationRecord
  has_many :article_types
  has_many :articles, through: :article_types
  validates :name, presence: true, length: { minimum: 2, maximum: 25 }
  validates_uniqueness_of :name
  
end