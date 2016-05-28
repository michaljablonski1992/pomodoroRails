class CreatePomodorosMade < ActiveRecord::Migration
  def up
    create_table :pomodoros_mades do |t|
      t.belongs_to :user, index: true
      t.integer :count, default: 0
      t.timestamps null: false
    end
  end

  def down
    drop_table :pomodoros_mades
  end
end
