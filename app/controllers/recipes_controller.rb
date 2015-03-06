class RecipesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_recipe, only: [:show, :update, :destroy]

  def index
    @recipes = if params[:keywords]
                 Recipe.where("name like ?", "%#{params[:keywords]}%")
               else
                 []
               end
  end

  def show
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
    render "show", status: 201
  end

  def update
    @recipe.update(recipe_params)
    head :no_content
  end

  def destroy
    @recipe.destroy
    head :no_content
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :instructions)
  end
end
