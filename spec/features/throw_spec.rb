require 'rails_helper'

RSpec.feature 'Throws', type: :feature do
  describe 'Testing game Rules' do
    before(:each) do
      @curb = Player.create(email: 'curb@gmail.com', password: '123456')
      @guest = Player.create(email: 'guest@gmail.com', password: '123456')
      @user = Player.create(email: 'user@gmail.com', password: '123456')
      Throw.create(item: 'rock')
      Throw.create(item: 'scissors')
      Throw.create(item: 'paper')
      visit '/'
    end

    it "Paper beats rock, user's score incremented" do
      curb_throw = 'rock'
      player_throw = 'paper'
      winner = Throw.player_won(curb_throw, player_throw, @guest)
      expect(winner).to eq('player')
      expect(@guest.score).to eq(1)
    end

    it 'Rock beats scissors' do
      curb_throw = 'rock'
      player_throw = 'scissors'
      winner = Throw.player_won(curb_throw, player_throw, @guest)
      expect(winner).to eq('curb')
    end

    it 'Paper beats rock' do
      curb_throw = 'paper'
      player_throw = 'rock'
      winner = Throw.player_won(curb_throw, player_throw, @guest)
      expect(winner).to eq('curb')
    end

    it 'Identical throws tie (rock == rock, etc.)' do
      curb_throw = 'rock'
      player_throw = 'rock'
      winner = Throw.player_won(curb_throw, player_throw, @guest)
      expect(winner).to eq('tie')
    end
  end
end
