class Category < ApplicationRecord
  include Visible

  has_many :articles
  
  validates :name, presence: true, uniqueness: true
  

  VALID_STATUSES = ['public', 'private', 'archived']

  validates :status, inclusion: { in: VALID_STATUSES }

  def archived?
    status == 'archived'
end
end
