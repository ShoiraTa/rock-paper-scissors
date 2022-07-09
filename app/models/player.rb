class Player < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def userName 
    self.email.split(/@/).first[0, 6]
  end

  def self.reset_score(current_player)
    curb = Player.find_by(email: "curb@gmail.com" )
    current_player[:score] = 0
    curb[:score] = 0
    current_player.save
    curb.save
  end

end
