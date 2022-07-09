class Throw < ApplicationRecord
  def self.player_won (curbAns, playerAns, current_player)
    curb = Player.find_by(email: "curb@gmail.com" )
    case [curbAns, playerAns ]
      when ['rock' , 'scissors'], ['scissors','paper'], ['paper', 'rock']
        curb.increment!(:score)
       return 'curb'
      when ['rock' , 'rock'], ['scissors','scissors'], ['paper', 'paper']
        return 'tie'
      else
        current_player.increment!(:score)
        return 'player'
    end
  end
end
