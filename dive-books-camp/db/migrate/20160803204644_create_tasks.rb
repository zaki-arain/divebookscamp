class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.integer :day_id
      t.integer :group_id
      t.string :theme, null: false
      t.string :activity
      t.boolean :required

      t.timestamps(null: false)
    end
  end
end
