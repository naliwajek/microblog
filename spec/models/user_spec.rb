require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'relations' do
    it { is_expected.to have_many(:messages).dependent(:destroy) }
    it do
      is_expected.to have_many(:active_relationships)
        .class_name('Relationship')
        .with_foreign_key('follower_id')
        .dependent(:destroy)
    end
  end
end
