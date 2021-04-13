class Api::RecipesController < ApplicationController
  def index
    p "*" * 8
    p current_user
    p "*" * 8

    @recipes = Recipe.all
    render 'index.json.jb'
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    p current_user
    @recipe = Recipe.new(
      chef: current_user.name,
      title: params[:title],
      prep_time: params[:prep_time],
      ingredients: params[:ingredients],
      directions: params[:directions],
      image_url: params[:image_url],
      user_id: current_user.id
    )
    if @recipe.save
      render 'show.json.jb'
    else
      render 'errors.json.jb'
    end
  end


  def update
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.chef = params[:chef] || @recipe.chef
    @recipe.title = params[:title] || @recipe.title
    @recipe.ingredients = params[:ingredients] || @recipe.ingredients
    @recipe.directions = params[:directions] || @recipe.directions
    @recipe.prep_time = params[:prep_time] || @recipe.prep_time
    @recipe.image_url = params[:image_url] || @recipe.image_url
    @recipe.save
    render 'show.json.jb'
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    render json: {message: "You have successfuly deleted the recipe"}
  end
end