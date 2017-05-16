require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do
      @user = User.create(firstname: 'P', lastname: 'Si', email: 'test@test.com', password: 'qwertyuiop', password_confirmation: 'qwertyuiop')
    end
    it 'is not valid without a firstname' do
      @user.firstname = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Firstname can't be blank")
    end
    it 'is not valid without a lastname' do
      @user.lastname = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Lastname can't be blank")
    end
    it 'is not valid without a email' do
      @user.email = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'is not valid without a password' do
      @user.password = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'is not valid if password and password confirmation do not match' do
      @user.password_confirmation = 'xyz123'
      expect(@user).to_not be_valid
    end

    it 'is not valid if length of the password is less than 8' do
      @user.password = 'abc123'
      @user.password_confirmation = 'abc123'
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end

    it 'is not valid if email already exists' do
      @user_new = User.new(firstname: 'P', lastname: 'Si', email: 'test@TEST.com', password: 'qwertyuiop', password_confirmation: 'qwertyuiop')
      expect(@user_new).to_not be_valid
      expect(@user_new.errors.full_messages).to include("Email has already been taken")
    end
    describe '.authenticate_with_credentials' do
      it 'authenticates with valid credentials' do
        user = User.authenticate_with_credentials('test@test.com', 'qwertyuiop')
        expect(user).to be_valid
      end
      it 'fails with wrong password' do
        user = User.authenticate_with_credentials('test@test.com', 'wrongpassword')
        expect(user).to eql(nil)
      end
      it 'accepts email with spaces' do
        user = User.authenticate_with_credentials('    test@test.com', 'qwertyuiop')
        expect(user).to be_valid
      end
      it "doesn't consider case in the email" do
        user = User.authenticate_with_credentials('test@TEST.com', 'qwertyuiop')
      end
    end


  end
end

