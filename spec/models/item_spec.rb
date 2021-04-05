require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品登録" do

    context '登録できるとき' do

      it 'すべての情報が正常であれば登録できること' do
      expect(@item).to be_valid
      end
      it 'priceが半角数字なら登録できる' do
      @item.price = '500'
      expect(@item).to be_valid
      end
      it 'priceが300以上なら登録できる' do
      @item.price = '301'
      expect(@item).to be_valid
      end
      it 'priceが9999999以下なら登録できる' do
      @item.price = '9999998'
      expect(@item).to be_valid
      end
    end


    context '新規登録できないとき' do
      it 'goods_nameが空では登録できない' do
      @item.goods_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Goods name can't be blank")
      end
      it 'explanationが空では登録できない' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idが空では登録できない' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'burden_idが空では登録できない' do
      @item.burden_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden can't be blank")
      end
      it 'start_idが空では登録できない' do
      @item.start_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Start can't be blank")
      end
      it 'preparation_idが空では登録できない' do
      @item.preparation_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Preparation can't be blank")
      end
      it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'category_idが0では登録できない' do
      @item.category_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it 'status_idが0では登録できない' do
      @item.status_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 0")
      end
      it 'burden_idが0では登録できない' do
      @item.burden_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden must be other than 0")
      end
      it 'start_idが0では登録できない' do
      @item.start_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Start must be other than 0")
      end
      it 'preparation_idが0では登録できない' do
      @item.preparation_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Preparation must be other than 0")
      end
      it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'priceが299以下では登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end
      it 'priceが10000000以上では登録できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end

      it 'priceが全角数字」では登録できない' do
      @item.price = "３００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが半角英数混合では登録できない' do
      @item.price = "a11111"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが2半角英語では登録できない' do
      @item.price = "aaaaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end


end
