class Api::V1::ThrowsController < ApplicationController
  def index
    @throw = Throw.order('RANDOM()').first
    render json: @throw
  end
end
