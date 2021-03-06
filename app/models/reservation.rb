class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :room

  def self.save_records(records, user_id)
    records.each do |record|
      array = record.split(',')
      reservation = Reservation.new({room_id: array[0].to_i, user_id: user_id, time: array[1].to_i, date: Date.current})
      reservation.save
    end
  end

  def blah
    self.id
    id
  end
end
