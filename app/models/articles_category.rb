class ArticlesCategory < ApplicationRecord
    self.primary_key = :category_id

    belongs_to :article
    belongs_to :category

    validates :article_id, presence: true
    validates :category_id, presence: true
end
