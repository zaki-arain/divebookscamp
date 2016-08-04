class CreateDrafters < ActiveRecord::Migration[5.0]
  def change
    create_table :drafters do |t|
      t.integer :user_id
      t.integer :schedule_id
      t.boolean :active, default: false

      t.timestamps(null: false)
    end
  end
end
