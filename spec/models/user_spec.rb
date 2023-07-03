require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do 
    it "is invalid when password not equals password confirmation" do
      user = User.new(
        first_name: 'tina',
        last_name: 'huang',
        password: 'abcd',
        password_confirmation: 'abcd1',
        email: 'test001@test.com'
      )
      expect(user).to_not be_valid
    end

    it "is invalid when password confirmation is missing" do
      user = User.new(password_confirmation: nil)
      expect(user).to_not be_valid
    end

    it "is invalid when first_name is missing" do
      user = User.new(first_name: nil)
      expect(user).to_not be_valid
    end

    it "is invalid when last_name is missing" do
      user = User.new(last_name: nil)
      expect(user).to_not be_valid
    end

    it "is invalid when email is missing" do
      user = User.new(email: nil)
      expect(user).to_not be_valid
    end

    it 'validates uniqueness of emails (case insensitive)' do
      user1 = User.new(email: 'test@test.com')
      user2 = User.new(email: 'TEST@TEST.COM')

      expect(user2).to_not be_valid
    end

    it 'is valid with a password of minimum length' do
      user = User.new(
        email: 'test@test.com',
        first_name: 'test',
        last_name: 'huang',
        password: 'password',
        password_confirmation: 'password'
        )
      expect(user).to be_valid
    end

    it 'is invalid with a password of less than minimum length' do
      user = User.new(password: 'pass')
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    let(:my_email) { 'test@test.com' }
    let(:my_password) { 'password' }
    let(:my_first_name) { 'test' }
    let(:my_last_name) { 'huang' }

    let(:space_email) { '    test@test.com'}
    let(:wront_case_email) { 'TEST@test.COM' }

    context 'when valid credentials are provided' do
      it 'returns the user object' do
        user = User.create(
          first_name: my_first_name,
          last_name: my_last_name,
          email: my_email, 
          password: my_password,
          password_confirmation: my_password
          )
        authenticated_user = User.authenticate_with_credentials(my_email, my_password)
        expect(authenticated_user).to eq(user)
      end
    end

    context 'when invalid credentials are provided' do
      it 'returns nil' do
        User.create(email: my_email, password: my_password)
        authenticated_user = User.authenticate_with_credentials(my_email, 'wrong_password')
        expect(authenticated_user).to be_nil
      end
    end

    context 'when types in a few spaces before and/or after their email address' do
      it 'authenticated successfully' do
        user = User.create(
          first_name: my_first_name,
          last_name: my_last_name,
          email: my_email, 
          password: my_password,
          password_confirmation: my_password
          )


        authenticated_user = User.authenticate_with_credentials(space_email, my_password)
        expect(authenticated_user).to eq(user)
      end
    end

    context 'when types in the wrong case for their email' do
      it 'authenticated successfully' do
        user = User.create(
          first_name: my_first_name,
          last_name: my_last_name,
          email: my_email, 
          password: my_password,
          password_confirmation: my_password
          )

        authenticated_user = User.authenticate_with_credentials(wront_case_email, my_password)
        expect(authenticated_user).to eq(user)
      end
    end
  end
end
