require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品の出品" do
    context '内容に問題がない場合'do
      it "product_name,description,category_id,status_id,burden_id,area_id,shipping_date_id,priceが存在すれば出品できる" do
        expect(@item).to be_valid
      end
      it "priceが¥300以上,¥9,999,999以下であれば出品できる" do
        @item.price = "50000"
        expect(@item).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "product_nameが空だと出品できない" do  
        @item.product_name = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it "descriptionが空だと出品できない" do  
        @item.description = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "category_idが空だと出品できない" do  
        @item.category_id = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it "status_idが空だと出品できない" do  
        @item.status_id = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not a number")
      end
      it "burden_idが空だと出品できない" do  
        @item.burden_id = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden is not a number")
      end
      it "area_idが空だと出品できない" do  
        @item.area_id = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Area is not a number")
      end
      it "Shipping_date_idが空だと出品できない" do  
        @item.shipping_date_id = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date is not a number")
      end
      it "priceが空だと出品できない" do  
        @item.price = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが¥299以下だと出品できない" do  
        @item.price = '299'  
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが¥10000000以上だと出品できない" do  
        @item.price = '10000000'  
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceが全角数字の場合は出品できない' do
        @item.price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end