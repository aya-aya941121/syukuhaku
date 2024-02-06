class Room < ApplicationRecord
    belongs_to :user
    has_one :photo
    accepts_nested_attributes_for :photo
    has_one_attached :photo
    validates :name, presence: true, length: { maximum: 30 }
    validates :description, presence: true, length: { maximum: 300 }
    validates :price, numericality: { only_integer: true, greater_than: 0 }
    validates :address, presence: true, length: { maximum: 50 }

    def photo_url
      if self[:photo_url].nil?
        # デフォルトの画像URLを返します
        "/Users/user/Desktop/syuku_develop/syukuapp/app/assets/images/shisetsu/default-room-photo.png"
      else
        self[:photo_url]
      end
    end

    def self.search(search)
        return Room.all unless search
        Room.where('name LIKE(?)', "%#{search}%")
      end

end
