class Comment < ApplicationRecord
  belongs_to :article, required: true
  validates :commenter, presence: true
  validates :body, presence: true
end
