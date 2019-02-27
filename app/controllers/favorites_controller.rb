class FavoritesController < ApplicationController
  before_action :authorize
  
  def index
    @favorites = current_user.locations.order(:name)
  end
  
  def create
    location = Location.find_or_create_from_location_params(params[:location])
    favorite = current_user.favorites.create!(location_id: location.id)
    if favorite.save
      redirect_to "/users/#{current_user.id}/favorites"
      flash[:notice] = "#{location.name} has been added to your Favorites"
    end
	end
end