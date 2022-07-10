Rails.application.routes.draw do
  devise_for :players

  namespace :api do
    namespace :v1 do
      resources :throws, defaults: { format: :json }
    end
  end

  post 'game/update_scores'
  post 'game/reset_score'
  root 'game#index'
end
