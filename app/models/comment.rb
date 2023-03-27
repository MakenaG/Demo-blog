class Comment < ApplicationRecord
    belongs_to :post
    validates :body, presence: true # this ensures that the comment has a body attribute
end
