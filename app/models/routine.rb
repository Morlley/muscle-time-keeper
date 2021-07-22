class Routine < ApplicationRecord
  belongs_to :user
  has_many :workouts
  has_many :next_routines

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :set
  belongs_to :rest

  with_options presence: true do
    validates :menu
  end

  with_options presence: true do
    validates :set, numericality: {only_integer: true, message: "is invalid. Input only integer", other_than: 1, message: "can't be blank"}
    validates :rest, numericality: {only_integer: true, message: "is invalid. Input only integer", other_than: 1, message: "can't be blank"}
  end
end
