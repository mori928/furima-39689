class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  # def index
  #   @items = Item.all
  # end

  def new
    @item = Item.new
    @shipping_times = ShippingTime.all 
  end

  def create
    @item = item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render new_item_path, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :price, :image).merge(user_id: current_user.id)
  end


end
