class PurchasesController < ApplicationController

  def index
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    binding.pry
  end

end
