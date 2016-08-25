class RestaurantsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    if @restaurant.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update_attributes(restaurant_params)
      flash[:success] = 'Information successfully updated'
      redirect_to root_path
    else
      # flash[:error] = "Encountered errors while updating: #{@restaurant.errors.full_messages}"
      message
      redirect_to action: :edit
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:name,
                                       :address,
                                       :zip_code,
                                       :delivery_radius,
                                       :phone_number,
                                       :email_address,
                                       :description,
                                       :cuisine)
  end

  def message
    message = 'Encountered errors while updating:'
    @restaurant.errors.full_messages.each {|str| message = [message, str].join(' ')}
    flash[:error] = message
  end
end
