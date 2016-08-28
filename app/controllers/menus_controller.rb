class MenusController < ApplicationController
  def new
    @menu = Menu.new
  end

  def create
    @restaurant = Restaurant.find(current_user.restaurants.first)
    @menu = @restaurant.menus.build(menu_params)
    binding.pry
    if @menu.save
      flash[:notice] = "#{@menu.name} created successfully"
      redirect_to root_path
    else
      flash[:error] = 'A name is required'
      redirect_to new_menu_path
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:name,
                                 :restaurant)
  end


end
