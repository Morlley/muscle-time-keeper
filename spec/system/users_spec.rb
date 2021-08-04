require 'rails_helper'

def basic_pass(path)
  username = ENV["BASIC_AUTH_USER"] 
  password = ENV["BASIC_AUTH_PASSWORD"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができるとき', :js => true do 
    it '正しい情報を入力することでユーザー新規登録ができてトップページに移動する' do
      # ベーシック認証
      basic_pass new_user_session_path
      # ログインページに移動する
      visit new_user_session_path
      # 新規作成ボタンがあることを確認する
      expect(page).to have_content("新規作成")
      # 新規作成ボタンを押すと新規登録のモーダルが出現する
      find('p[id="display-registration-modal"]').click
      expect(page).to have_content("メールアドレスで登録")
      # メールアドレスで登録を押すと新規登録ページへ移動する
      find(".email-registration").click
      expect(current_path).to eq(new_user_registration_path)
      # ユーザー情報を入力する
      fill_in "nickname", with: @user.nickname
      fill_in "email", with: @user.email
      fill_in "password", with: @user.password
      fill_in "password-confirmation", with: @user.password_confirmation
      select "1997", from: "user_birthday_1i"
      select "12", from: "user_birthday_2i"
      select "13", from: "user_birthday_3i"
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      # トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      # カーソルを合わせるとログアウトボタンが表示されることを確認する
      find('.user-hover').hover
      expect(page).to have_content("ログアウト")
    end
  end

  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # ベーシック認証
      basic_pass new_user_session_path
      # ログインページに移動する
      visit new_user_session_path
      # 新規作成ボタンがあることを確認する
      expect(page).to have_content("新規作成")
      # 新規作成ボタンを押すと新規登録のモーダルが出現する
      find('p[id="display-registration-modal"]').click
      expect(page).to have_content("メールアドレスで登録")
      # メールアドレスで登録を押すと新規登録ページへ移動する
      find(".email-registration").click
      expect(current_path).to eq(new_user_registration_path)
      # ユーザー情報を入力する
      fill_in "nickname", with: ""
      fill_in "email", with: ""
      fill_in "password", with: ""
      fill_in "password-confirmation", with: ""
      select "--", from: "user_birthday_1i"
      select "--", from: "user_birthday_2i"
      select "--", from: "user_birthday_3i"
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq user_registration_path
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'ログインができるとき' do 
    it '保存されているユーザーの情報と合致すればログインができる' do
      # ベーシック認証
      basic_pass new_user_session_path
      # ログインページに移動する
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in "email", with: @user.email
      fill_in "password", with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # トップページへ遷移することを確認する
      expect(current_path).to eq(root_path)
      # カーソルを合わせるとログアウトボタンが表示されることを確認する
      find('.user-hover').hover
      expect(page).to have_content("ログアウト")
    end
  end

  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      # ベーシック認証
      basic_pass new_user_session_path
      # ログインページに移動する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in "", with: @user.email
      fill_in "", with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # ログインページへ戻されることを確認する
      expect(current_path).to eq(new_user_session_path)
    end
  end
end

RSpec.describe 'マイページ', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @another_user = FactoryBot.create(:user)
  end

  context "マイページへ移動できるとき" do
    it "ログインしたユーザーはマイページへ移動できる" do
      # ベーシック認証
      basic_pass new_user_session_path
      # ログインページに移動する
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in "email", with: @user.email
      fill_in "password", with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # トップページへ遷移することを確認する
      expect(current_path).to eq(root_path)
      # カーソルを合わせるとマイページボタンが表示されることを確認する
      find('.user-hover').hover
      expect(page).to have_content("マイページ")
      # マイページボタンを押すとマイページへ移動できる
      find(".move-to-mypage").click
      expect(current_path).to eq(user_path(@user.id))
    end
  end

  context "マイページへ移動できないとき" do
    it "自分以外のユーザーのマイページへは移動できない" do
      # ベーシック認証
      basic_pass new_user_session_path
      # ログインページに移動する
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in "email", with: @user.email
      fill_in "password", with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # トップページへ遷移することを確認する
      expect(current_path).to eq(root_path)
      # 自分以外のユーザーのマイページへアクセスしようとするとトップページに戻される
      visit user_path(@another_user.id)
      expect(current_path).to eq(root_path)
    end
  end
end