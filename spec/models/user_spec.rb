require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザ新規登録' do
    context '登録可能' do
      it '必要な情報を全て入力すると登録できる' do
        expect(@user).to be_valid
      end
    end

    context '登録不可' do
      it 'nickanameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが重複していて登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'emailに@が含まれていなくて登録できない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 130)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end

      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdefgh'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input a mixture of single-byte alphanumeric characters.")
      end

      it 'passwordが数字のみでは登録できない' do
        @user.password = '12345678'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input a mixture of single-byte alphanumeric characters.")
      end

      it 'passwordが全角文字を含むと登録できない' do
        @user.password = '1qaz2wた田'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input a mixture of single-byte alphanumeric characters.")
      end

      it 'passwordとpasswrod_confirmationが不一致で登録できない' do
        @user.password = Faker::Internet.password(min_length: 10)
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
