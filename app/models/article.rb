class Article < ApplicationRecord
    include Visible

    has_many :comments, dependent: :destroy
    belongs_to :category
  
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
    validates :category, presence: true

    def self.last_five
        all.last(5)
    end

end

  