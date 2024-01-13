class Room < ApplicationRecord
    validates :name, presence: true, length: { maximum: 30 }
    validates :description, presence: true, length: { maximum: 300 }
    validates :price, numericality: { only_integer: true, greater_than: 0 }
    validates :address, presence: true, length: { maximum: 50 }
end
