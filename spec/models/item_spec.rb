require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'item出品機能' do
    context '出品できる時' do
      it '全ての情報が正しく入力されていれば、出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない時' do
      it '商品名が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      
      it '商品説明が空では出品できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      
      it '写真が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'カテゴリーが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end

      it '商品状態が空では出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition Select")
      end

      it '配送料の負担が空では出品できない' do
        @item.burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden Select")
      end

      it '配送元の地域が空では出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end

      it '発送日が空では出品できない' do
        @item.shipping_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date Select")
      end

      it '販売価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price Out of setting range", "Price Half-width number")
      end

      it '販売価格が300より低いの数値では出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it '販売価格が9,999,999より大きいの数値では出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it '販売価格が全角数字では登録できない' do
        @item.price = '１２００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range", "Price Half-width number")
      end

    end
  end
end
