class Community < ApplicationRecord
  has_many :post_boards, dependent: :destroy
  
  validates :name, presence: true
  validates :explanation, presence: true
end
