class CreateAlarms < ActiveRecord::Migration
  def change
    create_table :alarms do |t|
      t.text :description
      t.string :time
      t.boolean :repeat
      t.string :repeat_days
      t.boolean :active
      t.boolean :allow_snooze
      t.integer :snooze_duration
      t.boolean :maths_to_dismiss
      t.boolean :activated
      t.integer :number_of_snoozes
      t.boolean :skip_next_occurance
      t.integer :alarm_volume
      t.boolean :alarm_in_silent_mode
      t.boolean :vibrate

      t.timestamps
    end
  end
end
