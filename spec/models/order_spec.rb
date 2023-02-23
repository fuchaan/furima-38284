require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
  end

  context '内容に問題ない場合' do
    it '全ての項目が入力されていれば購入できること' do
      expect(@order).to be_valid
    end
    it '建物名が空でも購入できること' do
      @order.building = nil
      expect(@order).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'tokenが空では登録できないこと' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("クレジットカード情報を入力してください")
    end
    it 'user_id（購入者）が空だと購入できないこと' do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Userを入力してください")
    end
    it 'item_id（購入商品）が空だと購入できないこと' do
      @order.item_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Itemを入力してください")
    end
    it '郵便番号が空では保存ができないこと' do
      @order.post_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("郵便番号を入力してください")
    end
    it '郵便番号は、「３桁ハイフン４桁」の半角文字列のみ保存可能なこと' do
      @order.post_code = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include('郵便番号は無効です。次のように入力してください (例: 123-4567)')
    end
    it '都道府県が必須であること' do
      @order.prefecture_id = '1'
      @order.valid?
      expect(@order.errors.full_messages).to include("都道府県を入力してください")
    end
    it '市区町村が必須であること' do
      @order.municipalities = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("市区町村を入力してください")
    end
    it '番地が必須であること' do
      @order.address = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("番地を入力してください")
    end
    it '電話番号が必須であること' do
      @order.phone = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("電話番号を入力してください")
    end
    it '電話番号が10桁以上であること' do
      @order.phone = '090123456'
      @order.valid?
      expect(@order.errors.full_messages).to include('電話番号番号が短いです。正しく入力してください')
    end
    it '電話番号が11桁以下であること' do
      @order.phone = '090123456789'
      @order.valid?
      expect(@order.errors.full_messages).to include('電話番号番号が短いです。正しく入力してください')
    end
    it '電話番号が英数混合では登録できないこと' do
      @order.phone = 'abc12345678'
      @order.valid?
      expect(@order.errors.full_messages).to include('電話番号は無効です。半角数字で入力してください')
    end
  end
end
