require 'rails_helper'

RSpec.describe Routine, type: :model do
  before do
    @routine = FactoryBot.build(:routine)
  end

  context "確認ページへ遷移することができる" do
    it 'ルーティン名、トレーニング名、セット数、インターバル、ユーザー情報が存在すれば遷移できること' do
      expect(@routine).to be_valid
    end
  end

  context "確認ページへ遷移することができない" do
    it "ルーティン名が空では遷移できない" do
      @routine.name = ""
      @routine.valid?
      expect(@routine.errors.full_messages).to include("ルーティン名を入力してください")
    end

    it "トレーニング名が空では遷移できない" do
      @routine.menu = ""
      @routine.valid?
      expect(@routine.errors.full_messages).to include("トレーニング名を入力してください")
    end

    it "セット数が空では遷移できない" do
      @routine.set_count_id = 1
      @routine.valid?
      expect(@routine.errors.full_messages).to include("セット数を選択してください")
    end

    it "インターバルが空では遷移できない" do
      @routine.rest_id = 1
      @routine.valid?
      expect(@routine.errors.full_messages).to include("インターバルを選択してください")
    end

    it "ユーザー情報が紐付いてなければが遷移できない" do
      @routine.user = nil
      @routine.valid?
      expect(@routine.errors.full_messages).to include("Userを入力してください")
    end
  end
end
