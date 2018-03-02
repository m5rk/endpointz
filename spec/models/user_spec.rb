require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:medications) }

  describe '#email' do
    context 'when there is a user' do
      before { create :user }

      it { is_expected.to validate_uniqueness_of(:email) }
    end
  end

  describe '#password' do
    it { is_expected.to have_valid(:password).when 'foo', 'bar' }
    it { is_expected.not_to have_valid(:password).when nil, '' }
  end

  describe '#authenticate' do
    context 'when there is a user' do
      let(:user) { create :user, password: 'sekret' }

      context 'and the password is correct' do
        it 'is the user' do
          expect(user.authenticate('sekret')).to eq(user)
        end
      end

      context 'and the password is not correct' do
        it 'is false' do
          expect(user.authenticate('ruhroh')).to be_falsey
        end
      end
    end
  end
end
