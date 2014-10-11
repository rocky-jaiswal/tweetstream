class API::V1::GreetingsController < ApplicationController

  before_action :authenticate_user!

  def index
    render json: {hello: "welt"}.as_json
  end

end
