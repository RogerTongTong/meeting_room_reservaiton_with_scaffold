require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  describe "#logged_in?" do
    it "should return true if current_user is not nil" do
      session[:user_id] = 1
      expect(helper.logged_in?).to eq(true)
    end
    it "should return false if current_user is nil" do
      expect(helper.logged_in?).to eq(false)
    end
  end

  describe "#current_user" do
    it "should find user by session's user_id at the first time, but not invoke find_user again at the second time" do
      session[:user_id] = 1
      user = User.new
      expect(User).to receive(:find_by).with({id: 1}).and_return(user)
      expect(helper.current_user).to eq(user)

      expect(User).to receive(:find_by).never
      helper.current_user
    end
  end

  describe "#log_in" do
    it 'should set user_id into session when log_in is invoked' do
      user = User.new
      user.id = 1
      log_in(user)
      expect(session[:user_id]).to eq(user.id)
    end
  end

  describe "#log_out" do
    it 'should delete user_id from session when log_out is invoked' do
      session[:user_id] = 1
      log_out
      expect(session[:user_id]).to be_nil
    end
  end
end
