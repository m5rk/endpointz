require 'rails_helper'

describe V1::PlaylistsController do
  let(:user) { create :user }
  let(:token) { JsonWebToken.encode({user_id: user.id}) }

  before do
    request.env['HTTP_AUTHORIZATION'] = token
  end

  describe 'GET #index' do

    let(:request_method) { get :index, params: params, xhr: true }
    let(:params) { { } }

    context 'when the user has playlists' do
      before do
        1.upto(5) do |n|
          create :playlist, user: user, name: "Playlist #{n}"
        end
      end

      it 'is :ok' do
        request_method

        expect(response).to have_http_status(:ok)
      end

      it 'contains the playlists' do
        request_method

        expect(json[:data]).to have(5).playlists
      end
    end

    context 'when the user does not have any playlists' do
      it 'is :ok' do
        request_method

        expect(response).to have_http_status(:ok)
      end

      it 'does not contain any playlists' do
        request_method

        expect(json[:data]).to be_empty
      end
    end
  end

  describe 'POST #create' do
    let(:request_method) { post :create, params: params, xhr: true }
    let(:params) { { name: 'my playlist' } }

    it 'is :created' do
      request_method

      expect(response).to have_http_status(:created)
    end

    it 'adds a playlist to the user' do
      expect { request_method }.to change { user.playlists.count }.to(1)
    end
  end
end
