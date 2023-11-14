class Community < ApplicationRecord
  
  validates :name, presence: true
  validates :explanation, presence: true
end
