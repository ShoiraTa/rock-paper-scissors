require 'rails_helper'

RSpec.feature 'Games', type: :feature do
  describe 'Game' do
    before(:each) do
      @curb = Player.create(email: 'curb@gmail.com', password: '123456')
      @guest = Player.create(email: 'guest@gmail.com', password: '123456')
      @user = Player.create(email: 'user@gmail.com', password: '123456')
      Throw.create(item: 'rock')
      Throw.create(item: 'scissors')
      Throw.create(item: 'paper')
      visit '/'
    end
    it 'If user signed in current user is users email >= 5 letters' do
      visit '/players/sign_in'
      fill_in 'Email', with: 'user@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_content('user')
    end
    it 'If user not signed in current user is guest' do
      expect(page).to have_content('guest')
    end
    it 'Rock, scissor, paper cards are on the page' do
      expect(page).to have_content('Rock')
      expect(page).to have_content('Scissors')
      expect(page).to have_content('Paper')
    end
    it 'Reset score sets scores to 0' do
      @guest.increment!(:score)
      visit '/'
      expect(page).to have_content('guest : 1')
      click_button 'reset'
      expect(page).to have_content('guest : 0')
    end
  end
end
