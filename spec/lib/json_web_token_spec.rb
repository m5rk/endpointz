require 'rails_helper'

describe JsonWebToken do
  let(:payload) { { user_id: 31415 } }
  let(:decoded) { JsonWebToken.decode(encoded) }
  let(:encoded) { JsonWebToken.encode(payload) }

  describe '.encode', :freeze do
    it 'is a value that can be decoded with decode' do
      expect(decoded).to include('user_id' => 31415)
    end

    it 'includes the time the token was issued' do
      expect(decoded).to include('issued_at' => Time.now.to_i)
    end
  end

  describe '.decode' do
    context 'when it cannot be decoded' do
      let(:encoded) { JsonWebToken.encode(payload).reverse }

      it 'is nil' do
        expect(decoded).to be_nil
      end
    end
  end
end
