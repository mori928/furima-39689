class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :show]

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
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end
  
  # def show
  #   @item = Comment.new
  #   @comments = @prototype.comments.includes(:user)
  #   @prototype = Prototype.find(params[:id])
  # end

  # def update
  #   @item = Item.find(params[:id])
  #   if @item.update(item_params)
  #     redirect_to new
  #   else
  #     redirect_to '/'
  #   end
  # end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :cost_id, :area_id, :shipping_time_id, :price, :image).merge(user_id: current_user.id)
  end

end