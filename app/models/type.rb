class Type < ApplicationRecord
  has_many :article_types  #set up the many types connections
  has_many :articles, through: :article_types #has many through article types
  validates :name, presence: true, length: { minimum: 2, maximum: 25 }
  validates_uniqueness_of :name
  
end