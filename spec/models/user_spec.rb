require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    # 問題なし
    # 全て正常
    context '新規登録できるとき' do
      it 'nick_nameとemail、passwordとpassword_confirmation、first_nameとlast_name、first_name_rubiとlast_name_rubi、birthdayが存在すれば登録できる' do
      expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
      @user.password = 'a00000'
      @user.password_confirmation = 'a00000'
      expect(@user).to be_valid
      end
    end


    # 問題あり
    context '新規登録できないとき' do
      it 'nick_nameが空では登録できない' do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end
      it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下では登録できない' do
      @user.password = '11aaa'
      @user.password_confirmation = '11aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_name_rubiが空では登録できない' do
        @user.first_name_rubi = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name rubi can't be blank")
      end
      it 'last_name_rubiが空では登録できない' do
        @user.last_name_rubi = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name rubi can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'first_nameが半角英数では登録できない' do
        @user.first_name = 'ababa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Input full-width characters.")
      end
      it 'last_nameが半角英数では登録できない' do
        @user.last_name = 'ababa'
        @user.valid?
        expect(@user.errors.full_messages).to include( "Last name Input full-width characters.")
      end
      it 'first_name_rubiが全角ひらがなでは登録できない' do
        @user.first_name_rubi = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include( "First name rubi Input full-width katakana characters.")
      end
      it 'first_name_rubiが半角カタカナでは登録できない' do
        @user.first_name_rubi = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include( "First name rubi Input full-width katakana characters.")
      end
      it 'last_name_rubiが全角ひらがなでは登録できない' do
        @user.last_name_rubi = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include( "Last name rubi Input full-width katakana characters.")
      end
      it 'last_name_rubiが半角カタカナでは登録できない' do
        @user.last_name_rubi = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include( "Last name rubi Input full-width katakana characters.")
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'emailに@がない状態では登録できない' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'passwordが全角では登録できない' do
        @user.password = 's１２３４５'
        @user.password_confirmation = 's１２３４５'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
    end












  end
end
