require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }

  describe 'uniqueness' do
    before(:each) { create(:user) }

    it { should validate_uniqueness_of(:username) }
  end

  describe "#password=" do
    let(:user) { create(:user) }
    it "sets the password" do
      expect(user.password).to eq("hunter2")
    end
  end

  describe "#is_password?" do 
    let(:user) { create(:user) }
    it "verifies a password" do 
      expect(user.is_password?("hunter2")).to be true
    end
  end

  describe "#reset_session_token!" do 
    let(:user) { create(:user) }
    it "resets the token" do 
      old_session_token = user.session_token
      user.reset_session_token!
      expect(old_session_token).to_not eq(user.session_token)
    end
  end 

  describe "::find_by_credentials" do
    let(:user) { create(:user) }
    before { user.save! }
    it "finds the right user" do 
      expect(User.find_by_credentials(user.username, user.password)).to eq(user) 
    end
  end

end
