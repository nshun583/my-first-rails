class Category < ApplicationRecord
    include Discard::Model

    validates :category, presence: true
end
