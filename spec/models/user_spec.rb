require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "should successfully create a new user" do
      @user = User.create(first_name: 'Sam', last_name: 'Anderson', email: 'samjanderson@gmail.com', password:'password', password_confirmation:'password')
      expect(@user).to be_valid
      @user.errors.full_messages
    end

    it "is not valid without a first name present" do 
      @user = User.create(first_name: nil , last_name: 'Anderson', email: 'samjanderson@gmail.com', password:'password', password_confirmation:'password')
      expect(@user).not_to be_valid
      @user.errors.full_messages
    end
    
    it "is not valid without a last name present" do 
      @user = User.create(first_name: 'Sam' , last_name: nil , email: 'samjanderson@gmail.com', password:'password', password_confirmation:'password')
      expect(@user).not_to be_valid
      @user.errors.full_messages
    end

    it "is not valid without an email present" do
      @user = User.create(first_name: 'Sam' , last_name: 'Anderson' , email: nil , password:'password', password_confirmation:'password')
      expect(@user).not_to be_valid
      @user.errors.full_messages
    end

    it "is not valid without matching passwords" do
      @user = User.create(first_name: 'Sam', last_name: 'Anderson', email: 'samjanderson@gmail.com', password:'password', password_confirmation:'pass')
      expect(@user).not_to be_valid
      @user.errors.full_messages
    end

    # it "is not valid without a unique email" do 
    # end

    # it "is not valid without a minimum password length" do
    # end

    it "is valid when password is created with password, confirmation, matching and min length" do
      @user = User.create(first_name: 'Sam', last_name: 'Anderson', email: 'samjanderson@gmail.com', password:'password', password_confirmation:'password')
      expect(@user).to be_valid
      @user.errors.full_messages
    end
  end

  # describe '.authenticate_with_credentials' do
  #   it "should successfully log in with valid credentials" do
  #   end

  #   it "should not log in with invalid credentials" do
  #   end

  #   it "should ignore whitespace in email" do
  #   end

  #   it "should not be case sensitive" do 
  #   end
  # end

end