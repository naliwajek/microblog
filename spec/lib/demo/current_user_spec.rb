require 'rails_helper'

describe Demo::CurrentUser do
  describe '#current_user' do
    it 'returns first user as a current user' do
      User.create!(name: 'Foo')
      User.create!(name: 'Bar')

      expect(test_class.new.current_user.name).to eq('Foo')
    end
  end

  # Test class in a private namespace because
  # otherwise RSpec will pollute global namespace instead.
  private

  def test_class
    Class.new do
      include Demo::CurrentUser
    end
  end
end
