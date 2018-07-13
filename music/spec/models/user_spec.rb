require 'rails_helper'

RSpec.describe User, type: :model do
  

  describe 'validations' do
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:session_token)}

    it 'should validate password is 6 characters minimum' do
      user1 = User.create(email: "appleton@facebook.io", password: "1234")

      expect(user1.errors[:password]).to eq(["is too short (minimum is 6 characters)"])
    end
  end

  describe 'is_password' do
    subject(:user) {FactoryBot.build(:user)}

    it 'should return true if the password is correct' do
      expect(user.is_password?(1212)).to be true
    end

    it 'should return false if the password is incorrect' do
      expect(user.is_password?(1234456)).to be false
    end
  end

  describe 'reset_session_token' do

  end

  describe '::find_by_credentials' do
    
  end
end
