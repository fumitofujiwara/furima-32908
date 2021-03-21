require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品機能が投稿できるとき' do
      it 'image,name,description,selling_priceが存在すると投稿できる' do
        expect(@item).to be_valid
      end
      it 'category_id,status_id,delively_fee_id,delivery_area_id,delivery_date_idのidが1以外だと投稿できる' do
        expect(@item).to be_valid
      end
      it 'selling_priceが300円以上で半角の数字だと投稿できる' do
        @item.selling_price = 300
        expect(@item).to be_valid
      end
      it 'selling_priceが9,999,999円以下で半角の数字だと投稿できる' do
        @item.selling_price = 9999999
        expect(@item).to be_valid
      end
    end
    context '商品出品機能が投稿できないとき' do
      it 'imageが空だと投稿できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空だと投稿できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'descriptionが空だと投稿できない' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'category_idの数字が1だと投稿できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it 'status_idの数字が1だと投稿できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status must be other than 1"
      end
      it 'delivery_fee_idの数字が1だと投稿できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee must be other than 1"
      end
      it 'delivery_area_idの数字が1だと投稿できない' do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery area must be other than 1"
      end
      it 'delivery_date_idの数字が1だと投稿できない' do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery date must be other than 1"
      end
      it 'selling_priceが空だと投稿できない' do
        @item.selling_price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Selling price can't be blank", "Selling price is not a number", "Selling price is invalid"
      end
      it 'selling_priceが299円以下だと投稿できない' do
        @item.selling_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Selling price must be greater than or equal to 300"
      end
      it 'selling_priceが10000000円以下だと投稿できない' do
        @item.selling_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Selling price must be less than or equal to 9999999"
      end
      it 'selling_priceが全角の数字だと投稿できない' do
        @item.selling_price = "３５０"
        @item.valid?
        expect(@item.errors.full_messages).to include "Selling price is not a number"
      end
      it 'nameが40文字以上だと投稿できない' do
        @item.name = "a" * 41
        @item.valid?
        expect(@item.errors.full_messages).to include "Name is too long (maximum is 40 characters)"
      end
      it 'descriptionが1000文字以上だと投稿できない' do
        @item.description = "a" * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include "Description is too long (maximum is 1000 characters)"
      end

    end
  end
  
end
