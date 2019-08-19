class Equipment < ApplicationRecord
  belongs_to :user
  validates :brand, presence: true

end
