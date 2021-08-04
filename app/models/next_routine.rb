class NextRoutine < ApplicationRecord
  belongs_to :routine

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :set_count
  belongs_to :rest

  with_options presence: true do
    validates :menu
  end

  with_options presence: true, numericality: {only_integer: true, message: "整数を入力してください", other_than: 1, message: "を選択してください"} do
    validates :set_count_id
    validates :rest_id
  end
end
