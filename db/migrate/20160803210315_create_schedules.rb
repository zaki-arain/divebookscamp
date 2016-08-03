class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.date :start_date

      t.timestamps(null: false)
    end
  end
end
