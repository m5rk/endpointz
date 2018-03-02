require 'rails_helper'

describe V1::MedicationsController do
  let(:user) { create :user }
  let(:payload) { { user_id: user.id } }
  let(:token) { JsonWebToken.encode(payload) }

  describe 'POST #create' do
    let(:request_method) { post :create, params: params, xhr: true }
    let(:params) { { name: name } }
    let(:name) { 'My Medication A' }

    context 'when the token is valid' do
      before { request.env['HTTP_AUTHORIZATION'] = token }

      it 'is :created' do
        request_method

        expect(response).to have_http_status(:created)
      end

      it 'creates a medication for the user' do
        expect { request_method }.to change { user.medications.reload.count }.to(1)
      end
    end

    context 'when the token is invalid' do
      before { request.env['HTTP_AUTHORIZATION'] = token.reverse }

      it 'is :unauthorized' do
        request_method

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
