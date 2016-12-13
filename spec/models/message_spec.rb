require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_length_of(:content).is_at_most(150) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'scopes' do
    describe 'desc' do
      it 'shows messages in descending order according to created_at datetime' do
        user = User.create!(name: 'John Smith')
        Message.create!(content: 'Foo', user: user)
        Message.create!(content: 'Bar', user: user)

        expect(Message.all.desc.first.content).to eq('Bar')
      end
    end
  end
end
