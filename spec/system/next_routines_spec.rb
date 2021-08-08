require 'rails_helper'

def basic_pass(path)
  username = ENV["BASIC_AUTH_USER"] 
  password = ENV["BASIC_AUTH_PASSWORD"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe "Routines", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @routine = FactoryBot.build(:routine)
    @next_routine = FactoryBot.build(:next_routine)
  end

  context "追加メニューがあるルーティンを作成できる" do
    it "ログインしたユーザーは正しい情報を入力することで作成できる" do
      # ベーシック認証
      basic_pass new_user_session_path
      # ログインする
      visit new_user_session_path
      fill_in "email", with: @user.email
      fill_in "password", with: @user.password
      find('input[name="commit"]').click
      # トップページへ遷移することを確認する
      expect(current_path).to eq(root_path)
      # 「ルーティンを作成」のボタンがあることを確認する
      expect(page).to have_content("ルーティンを作成")
      # 作成ページへ移動する
      find('.create-routine').click
      expect(current_path).to eq new_routine_path
      # フォームに情報を入力する
      fill_in "routine_name", with: @routine.name
      fill_in "routine_menu", with: @routine.menu
      select "15秒", from: "routine_workout_time_id"
      select "3", from: "routine_set_count_id"
      select "45秒", from: "routine_rest_id"
      # 「メニューを追加」を押して追加メニューの情報を入力する
      find(".add-nested-btn").click
      find('.next-routine-input').set(@next_routine.menu)
      find(".next-workout-time-select").select("30秒")
      find(".next-set-select").select("4")
      find(".next-rest-select").select("1分")
      # 「確認画面へ」のボタンを押すと確認ページへ移動する
      find(".confirm-btn").click
      expect(current_path).to eq confirm_routines_path
      # 入力した情報が表示される
      expect(page).to have_content(@routine.name)
      expect(page).to have_content(@routine.menu)
      expect(page).to have_content("15秒")
      expect(page).to have_content("3セット")
      expect(page).to have_content("45秒")
      expect(page).to have_content(@next_routine.menu)
      expect(page).to have_content("30秒")
      expect(page).to have_content("4セット")
      expect(page).to have_content("1分")
      # 戻るボタンを押すと作成ページへ移動する
      find(".back-btn").click
      expect(current_path).to eq "/routines"
      # 入力した情報が保持されている
      expect(find(".routine-name-input").value).to have_content(@routine.name)
      expect(find(".input-training").value).to have_content(@routine.menu)
      expect(find("#routine_workout_time_id").value).to have_content("3")
      expect(find("#routine_set_count_id").value).to have_content("4")
      expect(find("#routine_rest_id").value).to have_content("4")
      expect(find(".next-routine-input").value).to have_content(@next_routine.menu)
      expect(find(".next-workout-time-select").value).to have_content("5")
      expect(find(".next-set-select").value).to have_content("5")
      expect(find(".next-rest-select").value).to have_content("5")
      # 「確認画面へ」のボタンを押す
      find(".confirm-btn").click
      # 作成ボタンを押すと作成されRouttineモデルのカウントが1上がる
      expect{
        find('input[name="commit"]').click
      }.to change { Routine.count }.by(1).and change { NextRoutine.count }.by(1)
      # 「作成が完了しました」の文字があることを確認する
      expect(current_path).to eq routines_path
      expect(page).to have_content("作成が完了しました")
      # 「トップページへ戻る」のリンクをクリックするとトップページへ戻る
      find(".move-to-root").click
      expect(current_path).to eq root_path
    end
  end

  context "追加メニューがあるルーティンを作成できない時" do
    it "正しい情報を入力しないと作成できない" do
      # ベーシック認証
      basic_pass new_user_session_path
      # ログインする
      visit new_user_session_path
      fill_in "email", with: @user.email
      fill_in "password", with: @user.password
      find('input[name="commit"]').click
      # トップページへ遷移することを確認する
      expect(current_path).to eq(root_path)
      # 「ルーティンを作成」のボタンがあることを確認する
      expect(page).to have_content("ルーティンを作成")
      # 作成ページへ移動する
      find('.create-routine').click
      expect(current_path).to eq new_routine_path
      # フォームに空の情報を入力する
      fill_in "routine_name", with: ""
      fill_in "routine_menu", with: ""
      select "--", from: "routine_workout_time_id"
      select "--", from: "routine_set_count_id"
      select "--", from: "routine_rest_id"
      # 「メニューを追加」を押して追加メニューの空の情報を入力する
      find(".add-nested-btn").click
      find('.next-routine-input').set("")
      find(".next-workout-time-select").select("--")
      find(".next-set-select").select("--")
      find(".next-rest-select").select("--")
      # 「確認画面へ」のボタンを押すと作成ページへ戻される
      find(".confirm-btn").click
      expect(page).to have_content("ルーティン作成")
    end
  end
end