class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.try(:admin?)
        scope.all
      else
        scope.none
      end
    end
  end

  def show?
     record == user
  end

  def create?
    record && user.blank?
  end

  def update?
    record == user
  end

  def destroy?
    record == user
  end
end
