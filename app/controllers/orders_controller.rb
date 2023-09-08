class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :ensure_correct_user, only: [:destroy, :edit]
  # before_action :non_purchased_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
    if current_user.nil? || current_user == @item.user || !@item.order.nil?
      redirect_to user_session_path
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path, notice:
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal, :area_id, :city, :address, :building_name, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_b612ffdf9f24bda46b46ad66"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  # def set_item
  #   @item = Item.find(params[:id])
  # end

end