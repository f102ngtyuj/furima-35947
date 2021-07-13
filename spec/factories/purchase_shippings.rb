FactoryBot.define do
  factory :purchase_shipping do
    post_code {'123-4567'}
    area_id {'2'}
    municipality {'市区町村'}
    address {'1-1'}
    building_name {'ビル103号'}
    phone_number {'09011112222'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
