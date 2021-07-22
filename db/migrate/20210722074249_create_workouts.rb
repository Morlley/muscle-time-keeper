class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.date :workout_date,  null: false
      t.references :user,    foreign_key: true
      t.references :routine, foreign_key: true
      t.timestamps
    end
  end
end
