class Category < ApplicationRecord
    has_many :articles

    validates :name, presence: true, uniqueness: true
    validates :description, length: { maximum: 255 }

    has_one_attached :image
end
