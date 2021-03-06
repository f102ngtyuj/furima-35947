class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :phone_number, numericality: { only_integer: true }, length: { minimum: 10 ,maximum: 11 }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(purchase_id: purchase.id, post_code: post_code, area_id: area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number)
  end

end
