class AddRoutineNameToWorkouts < ActiveRecord::Migration[6.0]
  def change
    add_column :workouts, :routine_name, :string
  end
end
