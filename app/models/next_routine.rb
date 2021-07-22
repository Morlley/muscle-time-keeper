class NextRoutine < ApplicationRecord
  belongs_to :routine

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :set
  belongs_to :rest

  with_options presence: true do
    validates :menu
  end

  with_options presence: true, numericality: {only_integer: true, message: "is invalid. Input only integer", other_than: 1, message: "can't be blank"} do
    validates :set_id
    validates :rest_id
  end
end
