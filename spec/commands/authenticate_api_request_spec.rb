require 'rails_helper'

describe AuthenticateApiRequest do
  let(:user) { create :user }
  let(:payload) { { user_id: user.id } }
  let(:token) { JsonWebToken.encode(payload) }
  let(:command) { AuthenticateApiRequest.call(headers) }

  context 'when there is an Authorization header' do
    context 'and it is valid' do
      let(:headers) { { 'Authorization' => "Bearer #{token}" } }

      describe '#success?' do
        it 'is success' do
          expect(command).to be_success
        end
      end

      describe '#errors' do
        it 'is empty' do
          expect(command.errors).to be_empty
        end
      end

      describe '#result' do
        it 'is the user' do
          expect(command.result).to eq(user)
        end
      end
    end

    context 'and it is not valid' do
      let(:headers) { { 'Authorization' => "Bearer #{token.reverse}" } }

      describe '#success?' do
        it 'is not success' do
          expect(command).not_to be_success
        end
      end

      describe '#errors' do
        it 'contains the invalid token error' do
          expect(command.errors).to include(token: ['Missing or invalid token'])
        end
      end

      describe '#result' do
        it 'is nil' do
          expect(command.result).to be_nil
        end
      end
    end
  end

  context 'when there is not an Authorization header' do
    let(:headers) { { } }

    describe '#success?' do
      it 'is not success' do
        expect(command).not_to be_success
      end
    end

    describe '#errors' do
      it 'contains the missing token error' do
        expect(command.errors).to include(token: ['Missing or invalid token'])
      end
    end

    describe '#result' do
      it 'is nil' do
        expect(command.result).to be_nil
      end
    end
  end
end
