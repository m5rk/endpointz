require 'rails_helper'

describe AuthenticateUser do
  let(:params) do
    {
      email: email,
      password: password
    }
  end
  let(:command) { AuthenticateUser.call(params[:email], params[:password]) }

  context 'when the credentials are valid' do
    let(:user) { create :user, password: 'sekret' }
    let(:email) { user.email }
    let(:password) { 'sekret' }

    describe '#success?' do
      it 'is true' do
        expect(command).to be_success
      end
    end

    describe '#errors' do
      it 'is empty' do
        expect(command.errors).to be_empty
      end
    end
  end

  context 'when the credentials are not valid' do
    let(:user) { create :user, password: 'sekret' }
    let(:email) { user.email }
    let(:password) { 'haxor' }

    describe '#success?' do
      it 'is false' do
        expect(command).not_to be_success
      end
    end

    describe '#errors' do
      it 'contains invalid credentials' do
        expect(command.errors).to include(user_authentication: ['invalid credentials'])
      end
    end
  end
end
