class Article < ApplicationRecord
    include Visible

    has_many :comments, dependent: :destroy
  
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }

    validates :category_id, presence: true
    belongs_to :category
end

  