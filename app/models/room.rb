class Room < ActiveRecord::Base
  has_many :reservations, -> { where(date: Date.current).order('time asc') }
end
