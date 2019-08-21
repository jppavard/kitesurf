class EquipmentPolicy < ApplicationPolicy
  def index?
    false
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def my_index?
    owner?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  private

  def owner?
    record.user == user
  end
end
