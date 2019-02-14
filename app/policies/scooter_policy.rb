class ScooterPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def create?
      true
    end

    def update?
      record.user == user
    end

    def destroy?
      record.user == user
    end
  end
end
