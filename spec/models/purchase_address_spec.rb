require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品の購入機能' do
    context '商品が購入できる時' do
      it '全ての値が正しく入力されていれば購入できる' do
        expect(@purchase_address).to be_valid
        sleep 0.1
      end

      it '建物名が空欄でも購入できる' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
        sleep 0.1
      end
    end

    context '商品の購入ができない時' do
      it '郵便番号が空のとき' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank", "Postal code Input correctly")
        sleep 0.1
      end

      it '都道府県が空のとき購入できない' do
        @purchase_address.prefecture_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture Select")
        sleep 0.1
      end
      
      it '市区町村が空のとき購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
        sleep 0.1
      end

      it '番地が空のとき購入できない' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
        sleep 0.1
      end

      it '電話番号が空のとき購入できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank", "Phone number Input only number")
        sleep 0.1
      end

      it '郵便番号にハイフン(-)を入れないと登録できない' do
        @purchase_address.postal_code = '6360202'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code Input correctly")
        sleep 0.1
      end

      it '電話番号にハイフン(-)と購入できない' do
        @purchase_address.phone_number = '080-5702-0954'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number Input only number")
        sleep 0.1
      end

      it '電話番号に文字列を入力すると購入できない' do
        @purchase_address.phone_number = 'あああ'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number Input only number")
        sleep 0.1
      end

      it 'tokenがなければ購入できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
        sleep 0.1
      end

      it '電話番号が12桁以上だと購入できない' do
        @purchase_address.phone_number = '090111122223'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number Input only number")
        sleep 0.1
      end

      it '電話番号が英数混合だと購入できない' do
        @purchase_address.phone_number = '090aaaabbbb'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number Input only number")
        sleep 0.1
      end

      it 'user_idが空だと購入できない' do
        @purchase_address.user_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
        sleep 0.1
      end

      it 'item_idが空だと購入できない' do
        @purchase_address.item_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end
