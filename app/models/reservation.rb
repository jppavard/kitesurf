class Reservation < ApplicationRecord
  belongs_to :equipment
  belongs_to :user

  # validates_uniqueness_of :equipment, :start_date, :scope => [:equipment, :start_date]
  validates :start_date, uniqueness: { scope: :equipment }

  after_initialize :set_date_today

  private

  def set_date_today
    self.start_date = Date.today
  end
end
