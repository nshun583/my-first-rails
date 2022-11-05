class Comment < ApplicationRecord
  include Visible
  include Discard::Model

  belongs_to :article
end
