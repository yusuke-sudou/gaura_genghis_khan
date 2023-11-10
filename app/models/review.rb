class Review < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :review_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true


  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
   # ransack用の検索対象フィールドを指定する
  def self.searchable_attributes
    %w[title body]
  end
  searchable_attributes.each do |field|
    scope "search_by_#{field}", ->(keyword) { where("#{field} LIKE ?", "%#{keyword}%") }
  end
  
  def self.ransackable_attributes(auth_object = nil)
   ["title", "body"] # 検索可能な属性名を指定
  end
  
  def self.ransackable_associations(auth_object = nil)
    [] # 検索可能な関連名を指定
  end

end
