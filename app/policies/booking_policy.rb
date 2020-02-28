class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.bookings_as_renter
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

  def approve?
    record.renter == user
  end

  def reject?
    record.renter == user
  end
end
