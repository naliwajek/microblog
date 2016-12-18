require 'rails_helper'

describe WebMessage do
  describe '#html_content' do
    it 'returns HTML ready sanitized message content' do
      content = "First line\nSecond line<strong>Do not remove me</strong><input>Remove input</input>"
      message = Message.new(content: content)

      web_ready_message = described_class.new(message)

      expect(web_ready_message.html_content).to \
        eq('First line<br />Second line<strong>Do not remove me</strong>Remove input')
    end
  end
end
