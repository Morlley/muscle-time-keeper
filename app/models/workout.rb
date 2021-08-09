class Workout < ApplicationRecord
  belongs_to :user
  belongs_to :routine

  with_options presence: true do
    validates :workout_date
    validates :routine_name
  end
end
