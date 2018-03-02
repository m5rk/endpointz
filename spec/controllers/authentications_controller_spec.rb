require 'rails_helper'

describe AuthenticationsController do
  describe 'POST #create' do
    let(:request_method) { post :create, params: params, xhr: true }
    let(:user) { create :user, password: 'sekret' }
    let(:params) do
      {
        email: email,
        password: password
      }
    end

    context 'when the credentials are valid', :freeze do
      let(:email) { user.email }
      let(:password) { 'sekret' }

      it 'is :ok' do
        request_method

        expect(response).to have_http_status(:ok)
      end

      it 'contains the token' do
        request_method

        expect(JsonWebToken.decode(json[:auth_token])).to include(user_id: user.id)
      end

      it 'contains the time the token was issued' do
        request_method

        expect(JsonWebToken.decode(json[:auth_token])).to include(issued_at: Time.now.to_i)
      end
    end

    context 'when the credentials are invalid' do
      let(:email) { user.email }
      let(:password) { 'haxor' }

      it 'is :unauthorized' do
        request_method

        expect(response).to have_http_status(:unauthorized)
      end

      it 'includes the errors' do
        request_method

        expect(json[:errors]).to include(user_authentication: ['invalid credentials'])
      end
    end
  end
end
