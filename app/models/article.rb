class Article < ApplicationRecord
  include Visible
  include Discard::Model

  has_many :comments, dependent: :destroy
  has_many :articles_categories, dependent: :destroy
  has_many :categories, through: :articles_categories
  
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
  