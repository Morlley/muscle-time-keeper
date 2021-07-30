require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context "新規登録できる" do
    it 'ニックネーム、メールアドレス、パスワード、生年月日が存在すれば登録できること' do
      expect(@user).to be_valid
    end
  end

  context "新規登録できない" do
    it 'ニックネームが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "ニックネームを入力してください"
    end
  
    it 'メールアドレスが空では登録できないこと' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Eメールを入力してください"
    end
  
    it 'パスワードが空では登録できないこと' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワードを入力してください"
    end
  
    it '生年月日が空では登録できないこと' do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "生年月日を入力してください"
    end
  
    it '重複したメールアドレスが存在すると登録できないこと' do
      @user.save
      @another_user = FactoryBot.build(:user, email: @user.email)
      @another_user.valid?
      expect(@another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end
  
    it 'メールアドレスに@が含まれていないと登録できないこと' do
      @user.email = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end
  
    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '123ab'
      @user.password_confirmation = '123ab'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end
  
    it 'パスワードが半角英数字混合でない場合登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは半角英数記号で入力してください')
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは半角英数記号で入力してください')
      @user.password = 'ｆ４３ｆｓｆ'
      @user.password_confirmation = 'ｆ４３ｆｓｆ'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは半角英数記号で入力してください')
    end
  
    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123abc'
      @user.password_confirmation = 'abc123'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
  end
end
