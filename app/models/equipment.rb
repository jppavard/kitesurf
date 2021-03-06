class Equipment < ApplicationRecord
  CATEGORIES = ['wave', 'freeride', 'freestyle', 'foil']

  belongs_to :owner, class_name: "User", foreign_key: :user_id
  has_many :reservations, dependent: :destroy

  mount_uploader :photo, PhotoUploader
  validates :brand, presence: true
  validates :rating, inclusion: { in: (0..5) }
  validates :size, presence: true, inclusion: { in: (3..16) }
  validates :style, inclusion: { in: CATEGORIES }
  validates :model, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :title, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model
  pg_search_scope :search,
                  against: %i[brand rating size style model price],
                  associated_against: {
                    reservations: :start_date
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
