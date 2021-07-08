FactoryBot.define do
  factory :item do
    association :user
    product_name {"商品名"}
    description {"商品の説明です"}
    category_id { 2 }
    status_id { 2 }
    burden_id { 2 }
    area_id { 2 }
    shipping_date_id { 2 } 
    price { 50000 }
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/furima-logo-white.png'), filename: 'furima-logo-white.png')
    end
  end
end
