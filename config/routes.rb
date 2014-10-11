Rails.application.routes.draw do

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :greetings, only: :index
    end
  end
  mount_devise_token_auth_for 'User', at: 'api/v1/auth'

  # as :user do
  #  Define routes for User within this block.
  # end

end
