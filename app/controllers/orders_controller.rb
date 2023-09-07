class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  # before_action :non_purchased_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path, notice:
    else
      @item = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal, :area_id, :city, :address, :building_name, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end