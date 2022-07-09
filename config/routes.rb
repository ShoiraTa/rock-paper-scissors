Rails.application.routes.draw do
  devise_for :players

  # devise_scope :player do
  #   DELETE "/players/sign_out(.:format)" => "game#destroy"
  # end

  namespace :api do
    namespace :v1 do 
      resources :throws, defaults: {format: :json}
    end
  end

  post 'game/update_scores'
  post 'game/reset_score'
  root "game#index"
end
