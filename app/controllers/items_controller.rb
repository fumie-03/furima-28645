class ItemsController < ApplicationController
   before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    unless @item.valid?
      render :new and return
    end
    @item.save
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :user_id, :category_id, :condition_id, :postage_id, :prefecture_id, :send_time_id, :price, :image).merge(user_id: current_user.id)
  end
end
