class Comment < ApplicationRecord
  belongs_to :article, required: true, class_name: "Article"
  validates :username, presence: true
  validates :body, presence: true
end
