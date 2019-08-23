class Reservation < ApplicationRecord
  belongs_to :equipment
  belongs_to :user

  after_initialize :set_date_today

  private

  def set_date_today
    self.start_date = Date.today
  end
end
