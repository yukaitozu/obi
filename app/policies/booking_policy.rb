class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.user == user || record.listing.user == user
  end

  def new?
    create?
  end

  def create?
    true
  end

end
