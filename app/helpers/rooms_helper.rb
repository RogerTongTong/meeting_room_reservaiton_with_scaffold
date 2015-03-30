module RoomsHelper
  def is_booked?(room, time)
    room.reservationseach do |reservation|
      if Date.current == reservation.date && reservation.time == time
        return true
      end
    end
    return false
  end
end
