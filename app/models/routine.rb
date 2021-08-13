class Routine < ApplicationRecord
  belongs_to :user
  has_many :workouts, dependent: :nullify
  has_many :next_routines, dependent: :destroy
  accepts_nested_attributes_for :next_routines, allow_destroy: true


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :workout_time
  belongs_to :set_count
  belongs_to :rest
  belongs_to :status

  with_options presence: true do
    validates :name
    validates :menu
    validates :status_id
  end

  with_options presence: true, numericality: {only_integer: true, message: "整数を選択してください", other_than: 1, message: "を選択してください"} do
    validates :workout_time_id
    validates :set_count_id
    validates :rest_id
  end
end
