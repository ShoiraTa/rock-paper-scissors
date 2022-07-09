class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_player!

  def set_current_player
    if !current_player
      current_player =  Player.find_by(email: "curb@gmail.com" )
      else
      current_player = current_player
    end
  end
  
end
