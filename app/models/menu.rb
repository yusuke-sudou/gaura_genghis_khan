class Menu < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  
  validates :name, presence: true
  validates :price, presence: true
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
end
