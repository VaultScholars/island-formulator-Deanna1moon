class FavoritesController < ApplicationController
  def index
    @favorites = Current.user.favorites.includes(:recipe)
  end
def create
  recipe = Recipe.find(params[:recipe_id])
  Current.user.favorites.create(recipe: recipe)

  redirect_back fallback_location: recipes_path
end

def destroy
  favorite = Current.user.favorites.find(params[:id])
  favorite.destroy

  redirect_back fallback_location: recipes_path
end
end
