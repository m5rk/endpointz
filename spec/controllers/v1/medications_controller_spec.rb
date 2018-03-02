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

  describe 'GET #index' do
    before do
      1.upto(5) do |n|
        create :medication, user: user, name: "Medication #{n}"
      end
    end

    let(:request_method) { get :index, params: params, xhr: true }
    let(:params) { { } }

    context 'when the token is valid' do
      before { request.env['HTTP_AUTHORIZATION'] = token }

      it 'is :ok' do
        request_method

        expect(response).to have_http_status(:ok)
      end

      it "lists the user's medications" do
        request_method

        expect(json[:data]).to have(5).medications
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
