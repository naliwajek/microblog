require 'rails_helper'

feature 'Widget management', type: :feature do
  before do
    User.create(name: 'Current User')
  end

  scenario 'User posts a new message and wants to see a successful message' do
    visit '/'

    fill_in 'message_content', with: 'Will I see a success message?'
    click_button 'Send'

    expect(page).to have_text('Thanks! Message was posted to your feed!')
  end

  scenario 'User posts a new message and wants to see that message in the feed' do
    visit '/'

    fill_in 'message_content', with: 'It is my first tweet ever!'
    click_button 'Send'

    expect(page).to have_text('It is my first tweet ever!')
  end

  scenario 'User posts an empty message and should see error about blank message' do
    visit '/'

    fill_in 'message_content', with: ''
    click_button 'Send'

    expect(page).to have_text('Content can\'t be blank')
  end

  scenario 'User posts a message which is too long' do
    visit '/'

    fill_in 'message_content', with: 'x' * 151
    click_button 'Send'

    expect(page).to have_text('Content is too long (maximum is 150 characters)')
  end

  scenario 'User deletes a message' do
    visit '/'
    fill_in 'message_content', with: 'Delete this message!'
    click_button 'Send'

    click_link 'Delete'

    expect(page).to_not have_text('Delete this message!')
    expect(page).to have_text('Message destroyed successfully!')
  end
end
