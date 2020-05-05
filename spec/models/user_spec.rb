require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:each) do 
    @user = User.new
  end

  describe 'Validations' do

    xit "is not valid without if password and password_confirmation is not the same" do
      @user_password_confirmation = User.new(password: 'password', password_confirmation: 'jungle')
      expect(@user_password_confirmation).not_to be_valid
    end

    xit "is not valid without a unique email address" do
      @user1 = User.new(first_name: 'Lee', last_name: 'McLee', email: 'lee@lee.com', password: 'password', password_confirmation: 'password')
      @user2 = User.new(first_name: 'L', last_name: 'McL', email: 'LEE@LEE.COM', password: 'password', password_confirmation: 'password')
      @user1.save
      @user2.save
      expect(@user1).to be_valid
      expect(@user2).not_to be_valid
    end

    xit "is not valid without a first_name" do
      expect(@user).not_to be_valid
    end

    xit "is not valid without a last_name" do
      expect(@user).not_to be_valid
    end

    xit "must have a password with minimum 8 characters" do
      @user1 = User.new(first_name: 'L', last_name: 'C', email: 'rc@rc.com', password: 'password', password_confirmation: 'password')
      @user2 = User.new(first_name: 'C', last_name: 'L', email: 'cl@cl.com', password: 'word', password_confirmation: 'word')
      expect(@user1).to be_valid
      expect(@user2).not_to be_valid
    end

  end

  describe '.authenticate_with_credentials' do 

    xit "should authenticate if email and password are valid" do
    @user = User.create(first_name: 'L', last_name: 'C', email: 'newemail@email.com', password: 'origional', password_confirmation: 'origional')
    @user.save
  
    expect(User.authenticate_with_credentials('newemail@email.com', 'origional')).to be_present
    end

    xit "should not authenticate if the email is incorrect" do
      @user = User.create(first_name: 'L', last_name: 'C', email: 'newemail@email.com', password: 'origional', password_confirmation: 'origional')
      @user.save
  
    expect(User.authenticate_with_credentials('oldemail@email.com', 'origional')).not_to be_present
    end

    xit "should not authenticate if the password is incorrect" do
      @user = User.create(first_name: 'L', last_name: 'C', email: 'newemail@email.com', password: 'origional', password_confirmation: 'origional')
      @user.save
  
    expect(User.authenticate_with_credentials('oldemail@email.com', 'newpassword')).not_to be_present
    end

    xit "should ignore white spaces" do
      @user = User.create(first_name: 'L', last_name: 'C', email: 'newemail@email.com', password: 'origional', password_confirmation: 'origional')
      @user.save
      expect(User.authenticate_with_credentials('  newemail@email.com   ', 'origional')).to be_present
    end

    xit "should be case-insensitive" do
      @user = User.create(first_name: 'L', last_name: 'C', email: 'newemail@email.com', password: 'origional', password_confirmation: 'origional')
      @user.save
      expect(User.authenticate_with_credentials('NEWEMAIL@EMAIL.COM', 'origional')).to be_present
    end

  end

end
