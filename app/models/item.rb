class Item < ApplicationRecord
  has_one_attached :image

  with_options presence: true do
    validates :user
    validates :product_name
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
    validates :description
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :area_id
    validates :shipping_date_id
  end
end
