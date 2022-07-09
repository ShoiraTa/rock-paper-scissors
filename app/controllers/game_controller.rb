class GameController < ApplicationController
  before_action :set_current_player
  def index
    @guest = Player.find_by(email: "guest@gmail.com")
    @curb = Player.find_by(email: "curb@gmail.com" )
    @curb_throw = Throw.order('RANDOM()').first
    @throws = Throw.all
  end

  def update_scores
    @player_throw = params[:player_item]
    @curb_throw = params[:curb_item]
    @current_player = current_player ? current_player : Player.find_by(email: "guest@gmail.com")

    @winner = Throw.player_won(@curb_throw, @player_throw, @current_player)
    respond_to do |format|
      format.turbo_stream do 
        render turbo_stream: [
          turbo_stream.update('turbo_winner', partial:'game/winner', locals: {winner: @winner, curb_throw: @curb_throw  }),
          turbo_stream.update('turbo_loading', partial:'game/curb_choosing', locals: { player_throw: @player_throw  })
        ]
      end
    end
  end

  def reset_score
    @current_player = current_player ? current_player : Player.find_by(email: "guest@gmail.com")
    Player.reset_score(@current_player)
    redirect_to game_update_scores_path
  end

end
