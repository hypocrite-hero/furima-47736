require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できるとき' do
      it '全ての項目が入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      # --- 基本項目 ---
      it '画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品情報が空では出品できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end

      # --- ActiveHash (id: 1 のとき) ---
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = 1 # プルダウンの初期値を選択
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end

      # --- 価格関連 ---
      it '価格が空では出品できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
      it '価格が300円未満では出品できない' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be greater than or equal to 300')
      end
      it '価格が10,000,000円以上では出品できない' do
        @item.item_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be less than or equal to 9999999')
      end

      it '価格に小数が含まれている場合は出品できない' do
        @item.item_price = 300.5
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be an integer')
      end
      it '価格に半角英字が含まれている場合は出品できない' do
        @item.item_price = '300asd'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
      it '価格が全角入力では出品できない' do
        @item.item_price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end

      # --- ユーザー関連 ---
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
