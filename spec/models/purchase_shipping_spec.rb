require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: @user.id, item_id: @item.id)
    sleep (1)
  end

  describe '購入できるとき' do
    context '購入できるとき' do
      it 'すべてのフォームの入力がされている' do
        expect(@purchase_shipping).to be_valid
      end
      it "tokenがあれば保存ができる" do
        expect(@purchase_shipping).to be_valid
      end
      it "building_name が空の場合でも保存できる" do
        @purchase_shipping.building_name = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping).to be_valid
      end
    end

    context '商品を購入できないとき' do
      it 'post_code が空では登録できない' do
        @purchase_shipping.post_code = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_code が半角のハイフンを含んだ正しい形式でないと保存できない' do
        @purchase_shipping.post_code = '123ー4567'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'area_idが 1 では保存できない' do
        @purchase_shipping.area_id = 1
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Area must be other than 1")
      end
      it 'municipality が空では保存できない' do
        @purchase_shipping.municipality = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'address が空では保存できない' do
        @purchase_shipping.address = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_number が空では保存できない' do
        @purchase_shipping.phone_number = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_number が英数混合では保存できない' do
        @purchase_shipping.phone_number = '００００００００aaa'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number is not a number")
      end
      it 'phone_number が11桁以内の数値のみでなければ保存できない' do
        @purchase_shipping.phone_number = '０００００００００００'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number is not a number")
      end
      it "token が空では登録できない" do
        @purchase_shipping.token = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
      end
      it "user_id が空では登録できない" do
        @purchase_shipping.user_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
      end
      it "item_id が空では登録できない" do
        @purchase_shipping.item_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
