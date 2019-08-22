class Equipment < ApplicationRecord
  CATEGORIES = ['wave', 'freeride', 'freestyle', 'foil']

  belongs_to :owner, class_name: "User", foreign_key: :user_id
  has_many :reservations

  mount_uploader :photo, PhotoUploader
  validates :brand, presence: true
  validates :rating, inclusion: { in: (0..5) }
  validates :size, presence: true, inclusion: { in: (3..16) }
  validates :style, inclusion: { in: CATEGORIES }
  validates :model, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :title, presence: true

  def self.search(search)
    if search
      p self.find_by(style: search)
    else
      self.all
    end
  end
end
