class ItemsController < ApplicationController
   before_action :set_item1, only: [:show, :edit, :update]
   before_action :authenticate_user!, only: [:new, :edit]

  def index
    @items = Item.order(id: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    unless @item.valid?
      render :new and return
    end
    @item.save
    redirect_to root_path
  end

  def show
  end

  def edit
    if current_user.id != @item.user.id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :user_id, :category_id, :condition_id, :postage_id, :prefecture_id, :send_time_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item1
    @item = Item.find(params[:id])
  end
end
