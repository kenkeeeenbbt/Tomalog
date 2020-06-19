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
end
