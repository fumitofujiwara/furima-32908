require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname,email,password,password_confirmation,last_name,first_name,last_name_furigana,first_name_furigana,birthdayが存在すると登録できる' do
        expect(@user).to be_valid
      end
      it 'password,password_confirmationが半角英数字混合で、6文字以上あれば登録できる。' do
        @user.password = 'abcd12'
        @user.password_confirmation = 'abcd12'
        expect(@user).to be_valid
      end
      it 'last_name,first_nameが漢字、カタカナ、ひらがなの入力で登録できる。' do
        @user.last_name = '一アあ'
        @user.first_name = '一アあ'
        expect(@user).to be_valid
      end
      it 'last_name_furigana,first_name_furiganaがカタカナの入力で登録できる。' do
        @user.last_name_furigana = 'テストー'
        @user.first_name_furigana = 'テストー'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank", 'Password is invalid',
                                                      "Password confirmation doesn't match Password"
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank", 'Last name is invalid'
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank", 'First name is invalid'
      end
      it 'last_name_furiganaが空では登録できない' do
        @user.last_name_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name furigana can't be blank", 'Last name furigana is invalid'
      end
      it 'first_name_furiganaが空では登録できない' do
        @user.first_name_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name furigana can't be blank", 'First name furigana is invalid'
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'emailに@がない場合登録できない' do
        @user.email = 'testtest.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it 'passwordが全角文字が入力された場合登録できない' do
        @user.password = 'Aa1234'
        @user.password_confirmation = 'Aa1234'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'abcd1'
        @user.password_confirmation = 'abcd1'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'last_nameが漢字、カタカナ、ひらがな以外では登録できない' do
        @user.last_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end
      it 'first_nameが漢字、カタカナ、ひらがな以外では登録できない' do
        @user.first_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end
      it 'last_name_furiganaがカタカナ以外では登録できない' do
        @user.last_name_furigana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name furigana is invalid'
      end
      it 'first_name_furiganaがカタカナ以外では登録できない' do
        @user.first_name_furigana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name furigana is invalid'
      end
    end
  end
end
