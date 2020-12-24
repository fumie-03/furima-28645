class BuyersController < ApplicationController
  before_action :sold_item, only:[:index, :create]

  def index
    @contact = ContactForm.new
    @item = Item.find(params[:item_id])
  end

  def create
    @contact = ContactForm.new(contact_params)
    @item = Item.find(params[:item_id])
    if @contact.valid?
      card
      @contact.save
      redirect_to root_path
    else
      render :index
    end
  end

  def card
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: contact_params[:token],
      currency: 'jpy'
    )
  end

  private

  def contact_params
    params.require(:contact_form).permit(:user_id, :item_id, :post_code, :prefecture_id, :city, :street_number, :building_name, :phone_number,).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def sold_item
    @item = Item.find(params[:item_id])
    if @item.buyer.present?
      redirect_to root_path
    end
  end
end

