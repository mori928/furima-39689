require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it '必要事項を全て過不足なく入力すると登録できる' do
        expect(@item).to be_valid   
      end
    end
  
    context '商品出品できないとき' do
      it "イメージが空だと保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
  
      it "商品名が空だと保存できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it "商品の説明が空だと保存できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
  
      it "カテゴリーが空だと保存できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
  
      it "商品状態が空だと保存できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
  
      it "配送料が空だと保存できない" do
        @item.cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end
  
      it "配送元の地域が空だと保存できない" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
  
      it "配送までの日数が空だと保存できない" do
        @item.shipping_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping time can't be blank")
      end
  
      it "販売価格が空だと保存できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number")
      end
 
      it "販売価格が￥300以下では保存できない" do
        @item.price = 299  # 300円未満の価格を設定する
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end 

       it "販売価格が￥¥10,000,000以上では保存できない" do
        @item.price = 10000000  # 100万円以上の価格を設定する
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      
      it "販売価格は半角数値以外では保存できない" do
        @item.price = '１２４'  # 半角数値以外の値を設定
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
     
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
