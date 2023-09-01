require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it '必要事項を全て過不足なく入力すると登録できる' do
        expect(@item).to be_valid   #FactoryBotを利用するとこの記述だけで良い
      end
    end
  
    context '商品出品できないとき' do
      it "イメージが空だと保存できない" do
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("写真を投稿してください")
      end
  
      it "商品名が空だと保存できない" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
  
      it "カテゴリーが空だと保存できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
  
      it "商品状態が空だと保存できない" do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品状態を選択してください")
      end
  
      it "配送料が空だと保存できない" do
        @item.cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料を選択してください")
      end
  
      it "配送元の地域が空だと保存できない" do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送元の地域を選択してください")
      end
  
      it "配送までの日数が空だと保存できない" do
        @item.shipping_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送までの日数を選択してください")
      end
  
      it "販売価格が空だと保存できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("300以上9999999以下で入力してください")
      end
    end
  end
