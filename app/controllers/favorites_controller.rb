class FavoritesController < ApplicationController
  before_action :authorize
  
  def index
    @favorites = current_user.favorites
  end
  
  def create
    location = Location.find_or_create_from_location_params(params[:location])
    favorite = current_user.favorites.create!(location_id: location.id)
    if favorite.save
      redirect_to "/users/#{current_user.id}/favorites"
    end
	end
  
  def destroy
    current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to "/users/#{current_user.id}/favorites"
  end 
end