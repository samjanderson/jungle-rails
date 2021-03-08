require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "should successfully create a new user" do
      @user = User.create(first_name: 'Sam', last_name: 'Anderson', email: 'samjanderson@gmail.com', password:'password', password_confirmation:'password')
      expect(@user).to be_valid     
    end

    it "is not valid without a first name present" do 
      @user = User.create(first_name: nil , last_name: 'Anderson', email: 'samjanderson@gmail.com', password:'password', password_confirmation:'password')
      expect(@user).not_to be_valid
      @user.errors.full_messages
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    
    it "is not valid without a last name present" do 
      @user = User.create(first_name: 'Sam' , last_name: nil , email: 'samjanderson@gmail.com', password:'password', password_confirmation:'password')
      expect(@user).not_to be_valid
      @user.errors.full_messages
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "is not valid without an email present" do
      @user = User.create(first_name: 'Sam' , last_name: 'Anderson' , email: nil , password:'password', password_confirmation:'password')
      expect(@user).not_to be_valid
      @user.errors.full_messages
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "is not valid without matching passwords" do
      @user = User.create(first_name: 'Sam', last_name: 'Anderson', email: 'samjanderson@gmail.com', password:'password', password_confirmation:'pass')
      expect(@user).not_to be_valid
      @user.errors.full_messages
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "is not valid without a unique email" do 
      @user = User.create(first_name: 'Sam', last_name: 'Anderson', email: 'samjanderson@gmail.com', password:'password', password_confirmation:'password')
      @user1 = User.create(first_name: 'Sam', last_name: 'Anderson', email: 'SamJAnderson@gmail.com', password:'password', password_confirmation:'password')
      expect(@user1).not_to be_valid
    end

    it "is not valid without a minimum password length" do
      @user = User.create(first_name: 'Sam', last_name: 'Anderson', email: 'samjanderson@gmail.com', password:'pas', password_confirmation:'pas')
      expect(@user).not_to be_valid
      @user.errors.full_messages
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 4 characters)")
    
    end

    it "is valid when password is created with password, confirmation, matching and min length" do
      @user = User.create(first_name: 'Sam', last_name: 'Anderson', email: 'samjanderson@gmail.com', password:'password', password_confirmation:'password')
      expect(@user).to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it "should successfully log in with valid credentials" do
      @user = User.create(first_name: 'Sam', last_name: 'Anderson', email: 'samjanderson@gmail.com', password:'password', password_confirmation:'password')
      valid_user = User.authenticate_with_credentials('samjanderson@gmail.com', 'password')
      expect(valid_user).to eq(@user)
    end

    it "should not log in with invalid credentials" do
      @user = User.create(first_name: 'Sam', last_name: 'Anderson', email: 'samjanderson@gmail.com', password:'pas', password_confirmation:'password')
      invalid_user = User.authenticate_with_credentials('samjanderson@gmail.com', 'password')
      expect(invalid_user).to eq(nil)
    end

    it "should ignore whitespace in email" do
      @user = User.create(first_name: 'Sam', last_name: 'Anderson', email: 'samjanderson@gmail.com', password:'password', password_confirmation:'password')
      valid_user = User.authenticate_with_credentials('  samjanderson@gmail.com  ', 'password')
      expect(valid_user).to eq(@user)
    end

    it "should not be case sensitive" do 
      @user = User.create(first_name: 'Sam', last_name: 'Anderson', email: 'samjanderson@gmail.com', password:'password', password_confirmation:'password')
      valid_user = User.authenticate_with_credentials('SamJAnderson@gmail.com', 'password')
      expect(valid_user).to eq(@user)
    end
  end

end