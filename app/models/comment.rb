class Comment < ApplicationRecord
  belongs_to :post
  validates :commenter, presence: true
  validates :body, presence: true
end
