class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :location
      t.references :celebrity, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :booking_confirmed, default: false

      t.timestamps
    end
  end
end
