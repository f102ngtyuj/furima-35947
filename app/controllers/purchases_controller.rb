class PurchasesController < ApplicationController

  def index
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @purchase = Purchase.create(purchase_params)
  end

  private 

  def purchase_params
    params.permit(:post_code, :area_id, :municipality, :address, :building_name, :phone_number)
  end

end
