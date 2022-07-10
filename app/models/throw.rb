class Throw < ApplicationRecord
  def self.player_won(curb_ans, player_ans, current_player)
    curb = Player.find_by(email: 'curb@gmail.com')
    case [curb_ans, player_ans]
    when %w[rock scissors], %w[scissors paper], %w[paper rock]
      curb.increment!(:score)
      'curb'
    when %w[rock rock], %w[scissors scissors], %w[paper paper]
      'tie'
    else
      current_player.increment!(:score)
      'player'
    end
  end
end
