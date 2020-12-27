class BuyersController < ApplicationController
  before_action :set_item
  before_action :sold_item, only:[:index, :create]
  before_action :authenticate_user!

  def index
    @contact = ContactForm.new
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def create
    @contact = ContactForm.new(contact_params)
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
    params.require(:contact_form).permit(:post_code, :prefecture_id, :city, :street_number, :building_name, :phone_number,).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def sold_item
    if @item.buyer.present?
      redirect_to root_path
    end
  end

end

