class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :ensure_correct_user, only: [:destroy, :edit]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity, object: @item
    end
  end

  def show
  end


  def destroy
    @item.destroy
    redirect_to '/'
  end

  def edit
    if current_user.nil? || current_user == @item.user || !@item.order.nil?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item) 
    else
      render :edit, status: :unprocessable_entity, object: @item
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :cost_id, :area_id, :shipping_time_id, :price, :image).merge(user_id: current_user.id)
  end

  def ensure_correct_user
    unless current_user == @item.user
      redirect_to root_path, alert: "You don't have permission to perform this action."
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

end