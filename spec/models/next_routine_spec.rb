require 'rails_helper'

RSpec.describe Routine, type: :model do
  before do
    @next_routine = FactoryBot.build(:next_routine)
  end

  context "確認ページへ遷移することができる" do
    it 'トレーニング名、ワークアウトタイム、セット数、インターバル、ルーティン情報が存在すれば遷移できること' do
      expect(@next_routine).to be_valid
    end
  end

  context "確認ページへ遷移することができない" do
    it "トレーニング名が空では遷移できない" do
      @next_routine.menu = ""
      @next_routine.valid?
      expect(@next_routine.errors.full_messages).to include("追加メニューのトレーニング名を入力してください")
    end

    it "ワークアウトタイムが空では遷移できない" do
      @next_routine.workout_time_id = 1
      @next_routine.valid?
      expect(@next_routine.errors.full_messages).to include("追加メニューのワークアウトタイムを選択してください")
    end

    it "セット数が空では遷移できない" do
      @next_routine.set_count_id = 1
      @next_routine.valid?
      expect(@next_routine.errors.full_messages).to include("追加メニューのセット数を選択してください")
    end

    it "インターバルが空では遷移できない" do
      @next_routine.rest_id = 1
      @next_routine.valid?
      expect(@next_routine.errors.full_messages).to include("追加メニューのインターバルを選択してください")
    end

    it "ルーティン情報が紐付いてなければが遷移できない" do
      @next_routine.routine = nil
      @next_routine.valid?
      expect(@next_routine.errors.full_messages).to include("Routineを入力してください")
    end
  end
end
