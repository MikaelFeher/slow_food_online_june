class Api::V1::RestaurantsController < Api::ApiController

  def index
    @restaurants = Restaurant.all
    # @restaurants.each do |restaurants|
    #   puts restaurants.values.join(': ')
    # end

      # binding.pry

    render json: {restaurants: @restaurants}
    # render json: 'v1/restaurants/index'
  end

end
