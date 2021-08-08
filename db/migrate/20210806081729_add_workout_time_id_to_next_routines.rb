class AddWorkoutTimeIdToNextRoutines < ActiveRecord::Migration[6.0]
  def change
    add_column :next_routines, :workout_time_id, :integer
  end
end
