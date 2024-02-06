class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reservations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable:recoverable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
    validates :name, presence: true, length: { maximum: 10 }
    validates :password, presence: true
    validates :password_confirmation, presence: true
  has_one_attached :avatar  
end
