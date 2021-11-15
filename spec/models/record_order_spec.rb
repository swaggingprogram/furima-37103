require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @record_order = FactoryBot.build(:record_order, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  context '内容に問題ない場合' do
    it '全ての値が正しければ保存ができること' do
      expect(@record_order).to be_valid
    end
    it 'buildingが空でも保存できる' do
      @record_order.building = ''
      expect(@record_order).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'postal_codeが空では保存ができないこと' do
      @record_order.postal_code = ''
      @record_order.valid?
      expect(@record_order.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @record_order.postal_code = '1111111'
      @record_order.valid?
      expect(@record_order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'prefecture_idを選択していないと保存できないこと' do
      @record_order.prefecture_id = ''
      @record_order.valid?
      expect(@record_order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'prefecture_idが1だと保存できないこと' do
      @record_order.prefecture_id = '1'
      @record_order.valid?
      expect(@record_order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @record_order.city = ''
      @record_order.valid?
      expect(@record_order.errors.full_messages).to include("City can't be blank")
    end
    it 'cityが数字だと保存できないこと' do
      @record_order.city = '111111'
      @record_order.valid?
      expect(@record_order.errors.full_messages).to include('City is invalid')
    end
    it 'portが空だと保存できないこと' do
      @record_order.port = ''
      @record_order.valid?
      expect(@record_order.errors.full_messages).to include("Port can't be blank")
    end
    it 'telが空だと保存できないこと' do
      @record_order.tel = ''
      @record_order.valid?
      expect(@record_order.errors.full_messages).to include("Tel can't be blank")
    end
    it 'telが11文字以上だと保存できないこと' do
      @record_order.tel = '123456789123'
      @record_order.valid?
      expect(@record_order.errors.full_messages).to include('Tel is invalid')
    end
    it 'telが10文字以下だと保存できないこと' do
      @record_order.tel = '123'
      @record_order.valid?
      expect(@record_order.errors.full_messages).to include('Tel is invalid')
    end
    it 'telが数字以外だと保存できないこと' do
      @record_order.tel = 'abcdefg'
      @record_order.valid?
      expect(@record_order.errors.full_messages).to include('Tel is invalid')
    end
    it 'tokenが空では登録できないこと' do
      @record_order.token = nil
      @record_order.valid?
      expect(@record_order.errors.full_messages).to include("Token can't be blank")
    end
    it 'userが紐付いていないと保存できないこと' do
      @record_order.user_id = nil
      @record_order.valid?
      expect(@record_order.errors.full_messages).to include("User can't be blank")
    end
    it 'itemが紐付いていないと保存できないこと' do
      @record_order.item_id = nil
      @record_order.valid?
      expect(@record_order.errors.full_messages).to include("Item can't be blank")
    end
  end
end
