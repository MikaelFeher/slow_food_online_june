class Api::V1::RestaurantsController < Api::ApiController

  def index
    @restaurants = Restaurant.all
    render json: {restaurants: @restaurants}
    # render :'v1/restaurants/index'
  end

end
