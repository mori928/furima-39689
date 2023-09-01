class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update]

  # def index
  #   @items = Item.all
  # end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to new
    else
      redirect_to '/'
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :cost_id, :area_id, :shipping_time_id, :price, :image).merge(user_id: current_user.id)
  end

end