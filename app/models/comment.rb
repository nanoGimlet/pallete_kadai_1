class Comment < ApplicationRecord
  belongs_to :article, required: true
  validates :username, presence: true
  validates :body, presence: true
end
