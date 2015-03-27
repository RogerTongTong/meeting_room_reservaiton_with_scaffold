class AddColumnToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :room_id, :integer
    add_column :reservations, :user_id, :integer
    add_column :reservations, :time, :integer
    add_column :reservations, :date, :integer
  end
end
