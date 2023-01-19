require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規出品' do
    context '新規出品できる場合' do
      it '正しく全項目が存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '新規出品できない場合' do
      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_nameが41文字以上では出品できない' do
        @item.item_name = Faker::Lorem.paragraph_by_chars(number: 41, supplemental: false)
        @item.valid?
        expect(@item.errors.full_messages).to include('Item name is too long (maximum is 40 characters)')
      end

      it 'infoが空では出品できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'infoが1001文字以上では出品できない' do
        @item.info = Faker::Lorem.paragraph_by_chars(number: 1001, supplemental: false)
        @item.valid?
        expect(@item.errors.full_messages).to include('Info is too long (maximum is 1000 characters)')
      end

      it 'category_idが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category を入力してください")
      end
      it 'category_idが---では出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category を入力してください")
      end

      it 'sales_status_idが空では出品できない' do
        @item.sales_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status を入力してください")
      end
      it 'sales_status_idが---では出品できない' do
        @item.sales_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status を入力してください")
      end

      it 'shipping_fee_status_idが空では出品できない' do
        @item.shipping_fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status を入力してください")
      end
      it 'shipping_fee_status_idが---では出品できない' do
        @item.shipping_fee_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status を入力してください")
      end

      it 'prefecture_idが空では出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture を入力してください")
      end
      it 'prefecture_idが---では出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture を入力してください")
      end

      it 'scheduled_delivery_idが空では出品できない' do
        @item.scheduled_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery を入力してください")
      end
      it 'category_idが---では出品できない' do
        @item.scheduled_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery を入力してください")
      end

      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300円未満では出品できない' do
        @item.price = Faker::Number.within(range: 1..300)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300円から9,999,999円の範囲で入力してください')
      end
      it 'priceが10,000,000円以上では出品できない' do
        @item.price = Faker::Number.within(range: 10_000_000..10_000_100)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300円から9,999,999円の範囲で入力してください')
      end
      it 'priceが小数点以下を含むと出品できない' do
        @item.price = Faker::Number.decimal(l_digits: 4, r_digits: 2)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は半角数字で入力してください')
      end
      it 'priceが負の数では出品できない' do
        @item.price = Faker::Number.within(range: -1000..-300)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300円から9,999,999円の範囲で入力してください')
      end
      it 'priceが全角漢字では出品できない' do
        @item.price = '山田太郎'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は半角数字で入力してください')
      end
      it 'priceが全角ひらがなでは出品できない' do
        @item.price = 'やまだたろう'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は半角数字で入力してください')
      end
      it 'priceが半角アルファベットでは出品できない' do
        @item.price = 'abcd'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は半角数字で入力してください')
      end
      it 'priceが全角アルファベットでは出品できない' do
        @item.price = 'ａｂｃｄ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は半角数字で入力してください')
      end
      it 'priceが全角数字では出品できない' do
        @item.price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は半角数字で入力してください')
      end
      it 'priceが半角記号では出品できない' do
        @item.price = '300+100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は半角数字で入力してください')
      end
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
