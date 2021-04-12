class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.date :date, null: false
      t.time :time, null: false
      t.string :title, null: false
      t.string :client, null: false
      t.text :zoom_url, null: false
      t.references :user

      t.timestamps
    end
  end
end
