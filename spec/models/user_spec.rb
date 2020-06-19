require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  describe '有効性の検証' do
    it '有効なファクトリを持つこと' do
      expect(build(:user)).to be_valid
    end
  
    it '名前、メール、パスワードがある場合、有効であること' do
      user = User.new(
          name: 'TestUser',
          email: 'test@expample.com',
          password: 'password'
      )
      expect(user).to be_valid
    end
  end

  describe '存在性の検証' do
    it '名前がない場合、無効であること' do
        @user.name = ' '
        expect(@user.valid?).to eq(false)
    end

    it 'メールアドレスがない場合、無効であること' do
        @user.email = ' '
        expect(@user.valid?).to eq(false)
    end

    it 'パスワードがない場合、無効であること' do
        @user.password = @user.password_confirmation = ' ' * 8
        expect(@user.valid?).to eq(false)
    end
  end

  describe '文字数の検証' do
    it '名前が20文字以内の場合、有効であること' do
        @user.name = 'a' * 20
        expect(@user.valid?).to eq(true)
    end

    it '名前が21文字以上の場合、無効であること' do
        @user.name = 'a' * 21
        expect(@user.valid?).to eq(false)
    end

    it 'メールアドレスが255文字以内の場合、有効であること' do
        @user.email = 'a' * 243 + '@example.com'
        expect(@user.valid?).to eq(true)
    end

    it 'メールアドレスが256文字以上の場合、無効であること' do
        @user.email = 'a' * 244 + '@example.com'
        expect(@user.valid?).to eq(false)
    end

    it 'パスワードが8文字以上の場合、有効であること' do
        @user.password = 'a' * 8
        expect(@user.valid?).to eq(true)
    end

    it 'パスワードが7文字以下の場合、無効であること' do
        @user.password = 'a' * 7
        expect(@user.valid?).to eq(false)
    end
  end
end
