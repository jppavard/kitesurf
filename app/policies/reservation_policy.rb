class ReservationPolicy < ApplicationPolicy

  def create?
    true
  end

  def my_index?
    true
  end

  def clients_reservations?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
