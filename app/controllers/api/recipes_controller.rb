class Api::RecipesController < ApplicationController
  def index
    @message = "Hello!"
    render 'index.json.jb'
  end
end
