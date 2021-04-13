require 'rails_helper'

RSpec.describe BuyAddress, type: :model do  # RSpec.describe 「 factorybotのクラス名 」, type: :model
  before do
    @buy_address = FactoryBot.build(:buy_address)  # ()の中はfactorybotのクラスで決めたfactoryのこと（２行目））
  end

  describe "購入情報登録" do

    context '登録できるとき' do

      it '全ての情報が正常であれば登録できる'do
      expect(@buy_address).to be_valid
      end

    end

    context '登録できないとき' do

      it 'user_idが空では登録できない' do
        @buy_address.user_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では登録できない' do
        @buy_address.item_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'postal_codeが空では登録できない' do
        @buy_address.postal_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'start_idが空では登録できない' do
        @buy_address.start_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Start can't be blank")
      end
      it 'cityが空では登録できない' do
        @buy_address.city = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では登録できない' do
        @buy_address.house_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'telが空では登録できない' do
        @buy_address.tel = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Tel can't be blank")
      end

      it 'postal_codeが-なしでは登録できない' do
        @buy_address.postal_code = '1234567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code is invalid")
      end
      it 'start_idが0では登録できない' do
        @buy_address.start_id = 0
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Start must be other than 0")
      end
      it 'telが12桁以上では登録できない' do
        @buy_address.tel = '111111111111'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Tel is too long (maximum is 11 characters)")
      end

      it 'tokenが空では登録できない' do
        @buy_address.token = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
    end

  end
end
