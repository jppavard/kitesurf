class Reservation < ApplicationRecord
  belongs_to :equipment
  belongs_to :user

  # validates_uniqueness_of :equipment, :start_date, :scope => [:equipment, :start_date]
  validates :start_date, uniqueness: { scope: :equipment }
  # validates , uniqueness: { scope: [:equipment, :start_date] }
end
