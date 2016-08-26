class DishesController < ApplicationController
  def new
    @menu = Menu.find(params[:menu_id])
    @dish = @menu.dishes.build
  end

  def create
    @menu = Menu.find(params[:menu_id])
    @dish = @menu.dishes.build(dish_params)
    if @dish.save
      flash[:notice] = "#{@dish.name} created successfully"
      redirect_to root_path
    else
      set_flash_message(@dish)
      redirect_to new_menu_dish_path(@menu)
    end
  end

  private

  def dish_params
    params.require(:dish).permit(:name,
                                 :price,
                                 :allergy_info,
                                 :ingredients,
                                 :calories)
  end

end
