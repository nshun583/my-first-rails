class Category < ApplicationRecord
    self.primary_key = :category_id
    
    include Discard::Model

    has_many :articles_categories
    has_many :articles, through: :articles_categories
    validates :category, presence: true
end