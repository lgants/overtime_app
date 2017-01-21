require 'rails_helper'

RSpec.describe User, type: :model do
  describe "user" do
    before do
      @user = User.create(first_name: "Jon", last_name: "Doe", email: "test@test.com", password: "password", password_confirmation: "password")
    end

    it "can be created" do
      expect(@user).to be_valid
    end

    it "cannot be created without first_name, last_name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end
end
