require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  context '内容に問題ない場合' do
    it '建物名以外が入力されている時建物の入力有無に関係なく保存できること' do
      expect(@order).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'tokenが空では登録できないこと' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が空では保存ができないこと' do
      @order.post_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Post code can't be blank")
    end
    it '郵便番号は、「３桁ハイフン４桁」の半角文字列のみ保存可能なこと' do
      @order.post_code = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
    end
    it '都道府県が必須であること' do
      @order.prefecture_id = '1'
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村が必須であること' do
      @order.municipalities = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Municipalities can't be blank")
    end
    it '番地が必須であること' do
      @order.address = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が必須であること' do
      @order.phone = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone can't be blank")
    end
    it '電話番号が10桁以上であること' do
      @order.phone = '090123456'
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number is too short')
    end
    it '電話番号が11桁以下であること' do
      @order.phone = '090123456789'
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number is too short')
    end
  end
end
