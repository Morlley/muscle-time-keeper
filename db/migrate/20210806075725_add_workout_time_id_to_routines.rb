class AddWorkoutTimeIdToRoutines < ActiveRecord::Migration[6.0]
  def change
    add_column :routines, :workout_time_id, :integer
  end
end
