class TweetsController < ApplicationController
  def index
    @items = Item.all
  end
end