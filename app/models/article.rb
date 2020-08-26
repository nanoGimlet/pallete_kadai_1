class Article < ApplicationRecord
    has_many :comments, dependent: :destroy, class_name: "Comment"
    validates :title, presence: true, length: { minimum: 3 }
    validates :text, presence: true
end
