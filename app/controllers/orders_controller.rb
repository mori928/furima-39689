class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :non_purchased_item, only: [:index, :create]

  def index
    item_id = params[:id]
    @item = item_id.present? ? Item.find(item_id) : nil
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
      Address.create(address_params)
      redirect_to root_path
    end

  private

  def order_params
    params.permit(:price).merge(user_id: current_user.id)
  end

  def address_params
    params.permit(:postal, :area_id, :city, :address, :building_name, :phone).merge(order_id: @order.id)
  end

end
