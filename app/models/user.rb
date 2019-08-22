class User < ApplicationRecord
has_many :reservations
has_many :equipments, through: :reservations
has_many :owned_equipments, class_name: 'Equipment'
has_many :owned_reservations, through: :owned_equipments, source: :reservations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :avatar, PhotoUploader

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  # validates :avatar, presence: true
  validates :email, presence: true, uniqueness: true
end
