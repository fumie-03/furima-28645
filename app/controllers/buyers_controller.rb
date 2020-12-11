class BuyersController < ApplicationController

  def index
    @contact = ContactForm.new
    @item = Item.find(params[:item_id])
  end

  def create
    @contact = ContactForm.new(contact_params)
    if @contact.valid?
      @contact.save
      redirect_to root_path
    else
      render :index
    end

    def contact_params
      params.permit(user_id, item_id, post_code, prefecture_id, city, street_number, building_name, phone_number, buyer)
    end
  end
end

