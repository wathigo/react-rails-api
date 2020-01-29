class FavouritesController < ApplicationController
  skip_before_action :authorize_request

  def create
    @favourite = Favourite.create!(favourite_params)
    json_response(@favourite, :created)
  end

  # DELETE /categories/:id
  def destroy
    @favourite.destroy
    head :no_content
  end

  private
  def favourite_params
    params.permit(:user_id, :property_id)
  end
end
