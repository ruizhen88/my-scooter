class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.scooters.present?
        scope.joins(:scooter).where(user: user)
      else
        scope.where(user: user)
      end
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    true
    # record.scooter.user == user
  end

  # def destroy?
  #   record.user == user
  # end
end
