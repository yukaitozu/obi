class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.renter == user || record.listing.borrower == user
  end

  def new?
    create?
  end

  def create?
    true
  end

end
