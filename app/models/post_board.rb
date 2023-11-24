class PostBoard < ApplicationRecord
  belongs_to :community
  belongs_to :user
  
  validates :body, presence: true
  
end
