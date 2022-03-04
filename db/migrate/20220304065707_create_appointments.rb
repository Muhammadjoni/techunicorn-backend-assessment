class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.time :appointment_time
      t.integer :appointment_duration
      t.date :appointment_day

      t.timestamps
    end
  end
end
