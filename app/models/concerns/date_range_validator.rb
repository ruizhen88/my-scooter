class DateRangeValidator < ActiveModel::Validator
  def validate(record)
    # record == new_current_booking that was being created
    # find all scooter bookings based on this record
    all_bookings = Booking.where(scooter: record.scooter)

    valid_booking = true

    all_bookings.each do |db_booking|
      # if record.start_date comes after any of the existing booking.start_date or before any end_date
      # valid_booking = false
      valid_booking = false if db_booking.start_date < record.start_date && db_booking.end_date > record.start_date
    end

    return valid_booking
  end
end
