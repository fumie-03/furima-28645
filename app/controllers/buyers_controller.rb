class BuyersController < ApplicationController

  def index
    @contact = ContactForm.new
    @item = Item.find(params[:item_id])
  end

  def create
    @contact = ContactForm.new(contact_params)
    @item = Item.find(params[:item_id])
    if @contact.valid?
      @contact.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
    def contact_params
      params.require(:contact_form).permit(:user_id, :item_id, :post_code, :prefecture_id, :city, :street_number, :building_name, :phone_number,).merge(user_id: current_user.id, item_id: params[:item_id])
    end
end

