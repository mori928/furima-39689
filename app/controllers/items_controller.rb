class ItemsController < ApplicationController
  # before_action :authenticate_user!
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Image.create(image_params)
    redirect_to '/'
  end

  private

  def item_params
    params.require(:item).permit(:content, :item).merge(user_id: current_user.id)
  end
end
