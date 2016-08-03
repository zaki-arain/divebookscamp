class CreateSelections < ActiveRecord::Migration[5.0]
  def change
    create_table :selections do |t|
      t.integer :schedule_id
      t.integer :user_id
      t.integer :task_id

      t.timestamps(null: false)
    end
  end
end
