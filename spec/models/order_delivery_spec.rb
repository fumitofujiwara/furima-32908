require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  before do
    @order_delivery = FactoryBot.build(:order_delivery)
  end

  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it 'postal_code,delivery_area_id,municipal_district,address,building_name,phone_numberが存在すると購入できる' do
        expect(@order_delivery).to be_valid
      end
      it 'building_nameが存在しなくても購入できる。' do
        @order_delivery.building_name = ''
        expect(@order_delivery).to be_valid
      end
    end
    context '商品が購入できないとき' do
      it 'postal_codeが空では購入できない' do
        @order_delivery.postal_code = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Postal code can't be blank", "Postal code is invalid. Include hyphen(-)"
      end
      it 'postal_codeにハイフンがなければ購入できない' do
        @order_delivery.postal_code = '1111111'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end
      it 'delivery_area_idが1だと購入できない' do
        @order_delivery.delivery_area_id = 1
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Delivery area must be other than 1"
      end
      it 'municipal_districtが空では購入できない' do
        @order_delivery.municipal_district = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Municipal district can't be blank"
      end
      it 'addressが空では購入できない' do
        @order_delivery.address = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Address can't be blank"
      end
      it 'phone_numberが空では登録できない' do
        @order_delivery.phone_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Phone number can't be blank", "Phone number is invalid"
      end
      it 'phone_numberが12桁以上では登録できない' do
        @order_delivery.phone_number = '111111111111'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Phone number is invalid"
      end
      it 'phone_numberにハイフンを入れると登録できない' do
          @order_delivery.phone_number = '11-111-1111'
          @order_delivery.valid?
          expect(@order_delivery.errors.full_messages).to include "Phone number is invalid"
      end
    end
  end
end
