class Category < ApplicationRecord
    include Discard::Model

    has_many :articles_categories
    has_many :articles, through: :articles_categories
    validates :category, presence: true
end