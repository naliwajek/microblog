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
    describe '#desc' do
      it 'shows messages in descending order according to created_at datetime' do
        user = User.create!(name: 'John Smith')
        Message.create!(content: 'Foo', user: user)
        Message.create!(content: 'Bar', user: user)

        expect(Message.all.desc.first.content).to eq('Bar')
      end
    end

    describe '#stream_for' do
      it 'returns user messages combined with messages of followed people' do
        user1 = User.create!(name: 'John The First')
        user2 = User.create!(name: 'John The Second')
        user3 = User.create!(name: 'John The Third')
        message1 = Message.create!(content: 'Foo', user: user1)
        message2 = Message.create!(content: 'Bar', user: user2)
        message3 = Message.create!(content: 'Baz', user: user3)
        Relationship.create!(follower: user1, followed: user2)

        expect(Message.stream_for(user1)).to eq([message2, message1])
      end
    end
  end
end
