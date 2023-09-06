require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it '必要事項を全て過不足なく入力すると登録できる' do
        expect(@order_address).to be_valid  
      end
      it '建物の名前を指定しなくても登録できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'postalが空では登録できない' do
        @order_address.postal = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal can't be blank")
      end 
      it 'postalは「3桁ハイフン4桁」の半角文字列でないと登録できない' do
        @order_address.postal = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal は「3桁ハイフン4桁」の半角文字列入力してください")
      end 
      it "areaが空だと保存できない" do
        @order_address.area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'cityが空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressは空では登録できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phoneは空では登録できない' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end     
      it 'phoneは半角数値でなければ登録できない' do
        @order_address.phone = '90-12345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone は半角数値で入力してください")
      end
      it 'phoneは9桁以下では登録できない' do
        @order_address.phone = '90123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone は10～11桁で入力してください")
      end
      it 'phoneは12桁以上では登録できない' do
        @order_address.phone = '123456789999'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone はハイフン無しで10～11桁で入力してください")
      end
    end
  end
end
