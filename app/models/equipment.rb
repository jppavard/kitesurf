class Equipment < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  has_many :reservations

  mount_uploader :photo, PhotoUploader
  validates :brand, presence: true
  validates :rating, inclusion: { in: (0..5) }
  validates :size, presence: true, inclusion: { in: (3..16) }
  validates :style, inclusion: { in: %(wave freeride freestyle foil) }
  validates :model, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :title, presence: true
end
