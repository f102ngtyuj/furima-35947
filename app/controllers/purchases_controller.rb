class PurchasesController < ApplicationController
  def index
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid? 
      @purchase_shipping.save
      redirect_to item_purchases_path
    else
      render :index
    end
  end

  private 

  def purchase_params
    item = Item.find(params[:item_id])
    params.require(:purchase_shipping).permit(:post_code, :area_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: item.id)
  end

end
